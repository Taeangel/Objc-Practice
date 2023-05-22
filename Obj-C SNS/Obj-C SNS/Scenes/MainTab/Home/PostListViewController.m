//
//  ViewController.m
//  Obj-C SNS
//
//  Created by song on 2023/05/11.
//

#import "PostListViewController.h"

@interface PostListViewController ()
{
  NSMutableArray<Post *> * postList;
}

@property (weak, nonatomic, nullable) FIRFirestore * db;
@property (weak, nonatomic) IBOutlet UITableView *postListTableView;

@end

@implementation PostListViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self initialSettion];
  [self registerNSNotificationCenter];
}

// MARK: initSetting

-(void) initialSettion {
  NSLog(@"%s , line: %d, %@", __func__, __LINE__, @"");
  self.db = [FIRFirestore firestore];
  self.postListTableView.dataSource = self;
  self.postListTableView.delegate = self;
  
  UINib * postCellNib = [UINib nibWithNibName:@"PostTableViewCell" bundle:nil];
  
  [_postListTableView registerNib:postCellNib forCellReuseIdentifier: PostTableViewCell.cellReuseIdentifier];
  
  __weak PostListViewController * weakSelf = self;
  [self fetchPosts:^(NSMutableArray<Post *> * fetchedPost ) {
    PostListViewController * strongSelf = weakSelf;
    
    if (strongSelf) {
      strongSelf->postList = fetchedPost;
      [strongSelf->_postListTableView reloadData];
    }
  }];
}

// MARK: NSNotificationCenter

- (void)dealloc {
  [[NSNotificationCenter defaultCenter]
   removeObserver:self
   name:PostListVCShouldFetchListNotification
   object:nil];
}

-(void)registerNSNotificationCenter {
  [[NSNotificationCenter defaultCenter]
   addObserver: self
   selector: @selector(handleNotification:)
   name:PostListVCShouldFetchListNotification object:nil];
}

// MARK: Selector

- (void) handleNotification:(NSNotification *) notification {
  
  if ([[notification name] isEqualToString:PostListVCShouldFetchListNotification]) {
    __weak PostListViewController * weakSelf = self;
    
    [self fetchPosts:^(NSMutableArray<Post *> * fetchedPost ) {
      PostListViewController * strongSelf = weakSelf;
      
      if (strongSelf) {
        strongSelf->postList = fetchedPost;
        [strongSelf->_postListTableView reloadData];
      }
    }];
  }
}

// MARK: TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return  postList.count ?: 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  Post * cellData = [postList objectAtIndex:indexPath.row];
  
  PostTableViewCell * cell = (PostTableViewCell *)[tableView dequeueReusableCellWithIdentifier: PostTableViewCell.cellReuseIdentifier forIndexPath:indexPath];
  [cell configureCell:cellData];
  return cell;
}

// MARK: TableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  
  Post * cellData = [postList objectAtIndex:indexPath.row];

  NSString * className = NSStringFromClass([DetailSNSViewController class]);
  
  UIStoryboard * storyboard = [UIStoryboard storyboardWithName:className bundle:nil];
  
  DetailSNSViewController * detailViewController = [storyboard instantiateViewControllerWithIdentifier:className];

  detailViewController.interfacePost = cellData;
  
  [_postListTableView deselectRowAtIndexPath:indexPath animated:TRUE];

  [self.navigationController pushViewController:detailViewController animated:TRUE];
}

// MARK: PostData

-(void) fetchPosts:(void(^)(NSMutableArray<Post *> *)) completion{
  
  [[[self.db collectionWithPath:@"posts"] queryOrderedByField:@"created_at" descending:YES]
   getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
    NSMutableArray<Post *> * tempPostList = [[NSMutableArray alloc] init];
    
    if (error != nil) {
      NSLog(@"Error getting documents: %@", error);
    } else {
      tempPostList = [Post fromFIRQureySnapshot:snapshot];
      completion(tempPostList);
    }
  }];
}
@end
