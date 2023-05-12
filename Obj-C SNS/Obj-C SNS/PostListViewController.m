//
//  ViewController.m
//  Obj-C SNS
//
//  Created by song on 2023/05/11.
//

#import "PostListViewController.h"

@interface PostListViewController ()
{
  NSMutableArray<Post *> * _postList;

}

@property (weak, nonatomic, nullable) FIRFirestore * db;

@end

@implementation PostListViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  
  
  self.db = [FIRFirestore firestore];
  
  // MARK: 문서 리스트 가져오기

  __weak PostListViewController * weakSelf = self;
  
  [[[self.db collectionWithPath:@"posts"] queryOrderedByField:@"updated_at" descending:YES]
      getDocumentsWithCompletion:^(FIRQuerySnapshot *snapshot, NSError *error) {
        if (error != nil) {
          NSLog(@"Error getting documents: %@", error);
        } else {
          
          PostListViewController * strongSelf = weakSelf;
          
          if (strongSelf) {
            strongSelf->_postList = [Post fromFIRQureySnapshot:snapshot];
          }
        }
      }];
  
  // MARK: 등록하기

//  FIRDocumentReference * newPostRef = [[self.db collectionWithPath:@"posts"] documentWithAutoID];
//
//  NSDictionary *newPostDictionary = @{
//    @"identifier": newPostRef.documentID,
//    @"title": @"말",
//    @"content": @"말과함께",
//    @"image": @"https://images.unsplash.com/photo-1675879102146-810c95632b5b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0NXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
//    @"created_at": [FIRTimestamp timestampWithDate:[NSDate date]],
//    @"updated_at": [FIRTimestamp timestampWithDate:[NSDate date]],
//  };
//
//  [newPostRef setData:newPostDictionary completion:^(NSError * _Nullable error) {
//    NSLog(@"%s , line: %d, %@", __func__, __LINE__, [error localizedDescription]);
//
//    if (error != nil) {
//      NSLog(@"Error getting document: %@", error);
//    } else {
//      NSLog(@"포스팅 추가 성공 - refId: %@", newPostRef.documentID);
//    }
//
//  }];
  
  // MARK: 데이터 수정
  
//    NSDictionary *updatedPostDictionary = @{
//      @"title": @"타이틀 - 수정함",
//      @"content": @"내용 - 수정함",
//      @"updated_at": [FIRTimestamp timestampWithDate:[NSDate date]]
//    };
//
//  [[[self.db collectionWithPath:@"posts"] documentWithPath:@"U2ruHtluYgLD4VwivQJO"] updateData:updatedPostDictionary completion:^(NSError * _Nullable error) {
//    if (error != nil) {
//      NSLog(@"Error updating document: %@", error);
//    } else {
//      NSLog(@"Document successfully updated");
//    }
//  }];

  // MARK: 데이터 삭제
  
//  이렇게 해도 되고
//  FIRDocumentReference * postDeleteRef = [self.db collectionWithPath:@"U2ruHtluYgLD4VwivQJO"];
//
//    [ postDeleteRef deleteDocumentWithCompletion:^(NSError * _Nullable error) {
//          if (error != nil) {
//            NSLog(@"Error removing document: %@", error);
//          } else {
//            NSLog(@"Document successfully removed!");
//          }
//    }];
//  이렇게 해도 되고
  
//  [[[self.db collectionWithPath:@"posts"] documentWithPath:@"U2ruHtluYgLD4VwivQJO"]
//      deleteDocumentWithCompletion:^(NSError * _Nullable error) {
//        if (error != nil) {
//          NSLog(@"Error removing document: %@", error);
//        } else {
//          NSLog(@"Document successfully removed!");
//        }
//  }];
}


@end
