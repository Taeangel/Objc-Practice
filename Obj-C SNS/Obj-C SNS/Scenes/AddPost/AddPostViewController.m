//
//  AddPostViewController.m
//  Obj-C SNS
//
//  Created by song on 2023/05/12.
//

#import "AddPostViewController.h"

@interface AddPostViewController ()

@property (weak, nonatomic, nullable) FIRFirestore * db;

@property (weak, nonatomic) IBOutlet UITextField *titleTestField;
@property (weak, nonatomic) IBOutlet UITextView *contentTextField;
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;

@end

@implementation AddPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  _db = [FIRFirestore firestore];
  
  _postImageView.sd_imageTransition = SDWebImageTransition.fadeTransition;
  _postImageView.sd_imageIndicator = SDWebImageProgressIndicator.defaultIndicator;
  _postImageView.contentMode = UIViewContentModeScaleAspectFill;
}

// MARK: IBActions

- (IBAction)onDismissBtnClicked:(UIButton *)sender {
  
  [self dismissViewControllerAnimated:TRUE completion:nil];
}
- (IBAction)onAddPostBtnClicked:(UIButton *)sender {
  NSLog(@"%s , line: %d, %@", __func__, __LINE__, @"포스트 버튼 클릭");
  
  __weak AddPostViewController * weakSelf = self;
  
  NSString * titleInput = _titleTestField.text ? : @"";
  NSString * contentInput = _contentTextField.text ? : @"";
  
  [self addPostWithTitle:titleInput
             withContent:contentInput
          withCompletion:^{
    NSLog(@"%s , line: %d, %@", __func__, __LINE__, @"컴플리션 완료");
    AddPostViewController * strongSelf = weakSelf;
    if (strongSelf) {
      [strongSelf dismissViewControllerAnimated:YES completion:nil];
    }
}];
}

- (IBAction)onPhotoSelectBtnClicked:(UIButton *)sender {
  NSLog(@"%s , line: %d, %@", __func__, __LINE__, @"사진선택 클릭");
  
  __weak AddPostViewController * weakSelf = self;

 SeletetUnsplashPhothViewController * selectPhotoVC = (SeletetUnsplashPhothViewController *) [SeletetUnsplashPhothViewController presentWithNavigationAndReturnVC:self];
  selectPhotoVC.photoSelectionBlock = ^(NSString * selectedUrl) {
    NSLog(@"%s , line: %d, %@", __func__, __LINE__, selectedUrl);
    AddPostViewController * strongSelf = weakSelf;
    if (strongSelf) {
      NSURL * imgUrl = [[NSURL alloc] initWithString: selectedUrl];
      
      [strongSelf->_postImageView sd_setImageWithURL:imgUrl];
    }
  };
}

// MARK: 인스턴스 메서드
-(void) addPostWithTitle: (NSString * )title
             withContent: (NSString *) content
          withCompletion: (void(^)(void)) completion// 첫번째 보이드가 반환 두번쨰 보이드가 매개변수
{
  FIRDocumentReference * newPostRef = [[self.db collectionWithPath:@"posts"] documentWithAutoID];
  
  NSDictionary *newPostDictionary = @{
    @"identifier": newPostRef.documentID,
    @"title": title,
    @"content": content,
    @"image": @"https://images.unsplash.com/photo-1675879102146-810c95632b5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0NXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
    @"created_at": [FIRTimestamp timestampWithDate:[NSDate date]],
    @"updated_at": [FIRTimestamp timestampWithDate:[NSDate date]],
  };
  
  [newPostRef setData:newPostDictionary completion:^(NSError * _Nullable error) {
    NSLog(@"%s , line: %d, %@", __func__, __LINE__, [error localizedDescription]);
    
    if (error != nil) {
      NSLog(@"Error getting document: %@", error);
    } else {
      
      [[NSNotificationCenter defaultCenter]postNotificationName:PostListVCShouldFetchListNotification object:self];
      completion();
    } 
  }];
  
}

@end
