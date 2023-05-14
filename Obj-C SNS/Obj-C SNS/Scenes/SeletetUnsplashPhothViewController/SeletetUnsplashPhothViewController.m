//
//  SeletetUnsplashPhothViewController.m
//  Obj-C SNS
//
//  Created by song on 2023/05/12.
//

#import "SeletetUnsplashPhothViewController.h"

@interface SeletetUnsplashPhothViewController ()
{
  NSNumber * _currentPage;
  NSMutableArray<USPhoto*>* _photoList ;
}

@property (weak, nonatomic) IBOutlet UISearchBar *photoSearchBar;
@property (strong, nullable) dispatch_block_t debounceSearchInputTask;

@property (weak, nonatomic) IBOutlet UICollectionView *photoListCollectionView;

@end

@implementation SeletetUnsplashPhothViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  _currentPage = [[NSNumber alloc] initWithInt: 1];
  
  [self initialSettion];
}

- (void)initialSettion {
  _photoListCollectionView.dataSource = self;
  _photoListCollectionView.delegate = self;
  
  UICollectionViewFlowLayout* flowlayout = [[UICollectionViewFlowLayout alloc] init];
  
  [_photoListCollectionView setCollectionViewLayout:flowlayout];
  
  [_photoListCollectionView setAutoresizingMask: UIViewAutoresizingFlexibleWidth];
  [_photoListCollectionView setAutoresizingMask: UIViewAutoresizingFlexibleHeight];
  
  UINib* cellNib = [UINib nibWithNibName:PhotoCollectionViewCell.cellReuseIdentifier bundle:nil];
  
  [_photoListCollectionView registerNib:cellNib forCellWithReuseIdentifier:PhotoCollectionViewCell.cellReuseIdentifier];
}

- (IBAction)onDismissBtnClicked:(id)sender {
  NSLog(@"%s , line: %d, %@", __func__, __LINE__, @"");
  
  [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)onChooseFinished:(id)sender {
  NSLog(@"%s , line: %d, %@", __func__, __LINE__, @"");
  
  [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
//  NSLog(@"%s , line: %d, %@", __func__, __LINE__, searchText);
  
  
  //글자 입력시 디바운스 작업 초기화
  if (_debounceSearchInputTask != nil) {
    dispatch_block_cancel(_debounceSearchInputTask);
    _debounceSearchInputTask = nil;
  }
  
  if (searchText.length < 1) {
    return;
  }
  
  
  __weak SeletetUnsplashPhothViewController * weakSelf = self;
  
  
  dispatch_block_t task = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, ^{
    NSLog(@"%s , line: %d,디바운스된 글자 %@", __func__, __LINE__, searchText);
    
    SeletetUnsplashPhothViewController * strongSelf = weakSelf;
    if (strongSelf) {
      [self searchPhotoApiCall:searchText withPage: strongSelf->_currentPage withCompletion:^(USPhotoSearchResponse* response) {
        NSLog(@"%s , line: %d, %d", __func__, __LINE__, response.result.count);
        strongSelf->_photoList = response.result;
        
        dispatch_async(dispatch_get_main_queue(), ^{
          [strongSelf->_photoListCollectionView reloadData];
        });
      }];
    }
  });
  
  _debounceSearchInputTask = task;
  
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.7 * NSEC_PER_SEC), dispatch_get_main_queue(), task);
   
}

- (void) searchPhotoApiCall: (NSString *) searchTerm
                   withPage: (NSNumber * ) page
             withCompletion: (void(^)(USPhotoSearchResponse *)) completion
{
  NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
  
  NSURLSession* sesson = [NSURLSession sessionWithConfiguration:config];
  
  NSURLComponents* components = [NSURLComponents new];
  [components setScheme: @"https"];
  [components setHost: @"api.unsplash.com"];
  [components setPath: @"/search/photos"];
  [components setQuery: [@"page=" stringByAppendingString:[page stringValue]]];
  [components setQuery: [@"query=" stringByAppendingString:searchTerm]];
  
  NSURL* url = [components URL];
  
  NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL: url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval: 60.0];
  
  [request addValue: @"Client-ID 7K-mFNJtAu-LaCA41rtGVFdm9l4UP9Tz1WyBom4ApqE"  forHTTPHeaderField:@"Authorization"];
  
  [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
  [request setHTTPMethod:@"GET"];
  
  NSURLSessionTask* dataTask = [sesson dataTaskWithRequest: request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error) {
      NSLog(@"%s , line: %d, %@", __func__, __LINE__, @"에러발생 ");
      return;;
    }
    
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    USPhotoSearchResponse* photoListResponse = [[USPhotoSearchResponse alloc] initWithDictionary:json];
    
    completion(photoListResponse);
  }];
  
  [dataTask resume];
  
  
  
//https://api.unsplash.com/search/photos?page=1&query=office
  NSURLSession* session = [NSURLSession sessionWithConfiguration:config];
   
}

// MARK: UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section{
  return _photoList.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
  USPhoto* cellData = [_photoList objectAtIndex: indexPath.item];
  
  
  PhotoCollectionViewCell* cell = (PhotoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:PhotoCollectionViewCell.cellReuseIdentifier forIndexPath:indexPath];
  
  [cell configureCell:cellData];
  
  return cell;
}

// MARK: FlowLayout


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  CGFloat width = UIScreen.mainScreen.bounds.size.width / 2 - 20;
  CGFloat height = width * 1.5;
  return  CGSizeMake(width, height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
  return UIEdgeInsetsMake(10, 10, 10, 10);
}

@end
