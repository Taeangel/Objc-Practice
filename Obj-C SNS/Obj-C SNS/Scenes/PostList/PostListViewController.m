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
  
  __weak PostListViewController * weakSelf = self;
  
  [self fetchPosts:^(NSMutableArray<Post *> * fetchedPost ) {
    PostListViewController * strongSelf = weakSelf;
    
    if (strongSelf) {
      strongSelf->postList = fetchedPost;
      [strongSelf->_postListTableView reloadData];
    }
  }];
  
  [[NSNotificationCenter defaultCenter]
   addObserver: self
   selector: @selector(handleNotification:)
   name:PostListVCShouldFetchListNotification object:nil];
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter]
   removeObserver:self
   name:PostListVCShouldFetchListNotification
   object:nil];
}

-(void) initialSettion {
  NSLog(@"%s , line: %d, %@", __func__, __LINE__, @"");
  self.db = [FIRFirestore firestore];
  self.postListTableView.dataSource = self;
  self.postListTableView.delegate = self;
  
  UINib * postCellNib = [UINib nibWithNibName:@"PostTableViewCell" bundle:nil];
  
  [_postListTableView registerNib:postCellNib forCellReuseIdentifier: PostTableViewCell.cellReuseIdentifier];
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

// MARK: 테이블뷰 데이터소스

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

  
  
}

// MARK: 포스트 데이터

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

-(void) editPost:(FIRDocumentReference *) postRef {
  
  NSDictionary * updatedPostDictionary = @{
    @"title": @"타이틀 - 수정함",
    @"content": @"내용 - 수정함",
    @"updated_at": [FIRTimestamp timestampWithDate:[NSDate date]]
  };
  
  [[[self.db collectionWithPath:@"posts"] documentWithPath: postRef.documentID] updateData:updatedPostDictionary completion:^(NSError * _Nullable error) {
    if (error != nil) {
      NSLog(@"Error updating document: %@", error);
    } else {
      NSLog(@"Document successfully updated");
    }
  }];
}

-(void) deletePost: (NSString *) postIdentifier {
  FIRDocumentReference * postDeleteRef = [self.db collectionWithPath: postIdentifier];
  
  [ postDeleteRef deleteDocumentWithCompletion:^(NSError * _Nullable error) {
    if (error != nil) {
      NSLog(@"Error removing document: %@", error);
    } else {
      NSLog(@"Document successfully removed!");
    }
  }];
}
@end
