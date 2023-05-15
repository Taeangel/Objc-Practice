//
//  DetailSNSViewController.m
//  Obj-C SNS
//
//  Created by song on 2023/05/15.
//

#import "DetailSNSViewController.h"
@import SDWebImage;

@interface DetailSNSViewController () {
  Post * _post;
}
@property (weak, nonatomic, nullable) FIRFirestore * db;

@property (weak, nonatomic) IBOutlet UILabel *postId;
@property (weak, nonatomic) IBOutlet UILabel *postTitle;
@property (weak, nonatomic) IBOutlet UILabel *postContent;
@property (weak, nonatomic) IBOutlet UILabel *postCreatedAt;
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;

@end

@implementation DetailSNSViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self initSetting];
}

-(void) initSetting {
  _post = _interfacePost;
  
  [_postImageView sd_setImageWithURL:[NSURL URLWithString:_post.image]
               placeholderImage:[UIImage systemImageNamed:@"photo.artframe"]];
  
  _postId.text = [@"id: " stringByAppendingString: _post.identifier];
  _postTitle.text = [@"title: " stringByAppendingString: _post.title];
  _postContent.text = [@"content: " stringByAppendingString: _post.content];
  _postCreatedAt.text = [@"createdAt: " stringByAppendingString: [_post.createdAt toString]];
  
  self.navigationItem.title = _post.title;
  
  self.db = [FIRFirestore firestore];

}

- (IBAction)onDeleteBtnClicked:(id)sender {
  
  NSString * message = @"정말로 삭제하시겠습니까?";
    
  UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle: UIAlertControllerStyleActionSheet];
  
  UIAlertAction* noAction = [UIAlertAction actionWithTitle:@"아닙니다!" style: UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
  
  __weak DetailSNSViewController * weakSelf = self;
  
  UIAlertAction* yesAction  = [UIAlertAction actionWithTitle:@"네 삭제하겠습니다!" style: UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
    DetailSNSViewController * strongSelf = weakSelf;
    if (strongSelf) {
      NSLog(@"%s , line: %d, %@", __func__, __LINE__, strongSelf->_post.identifier);
    }
    
    [self deletePost: strongSelf->_post.identifier];
    
    [self.navigationController popViewControllerAnimated:TRUE];

  }];
  
  [alert addAction:noAction];
  [alert addAction:yesAction];

  [self presentViewController:alert animated:YES completion:nil];

}

- (IBAction)onModifyPostBtnClicked:(id)sender {
  
  NSString * className = NSStringFromClass([ModifySNSViewController class]);
  
  UIStoryboard * storyboard = [UIStoryboard storyboardWithName:className bundle:nil];
  
  ModifySNSViewController * modifyViewController = [storyboard instantiateViewControllerWithIdentifier:className];

  modifyViewController.interfacePost = _post;
  
  [self.navigationController pushViewController: modifyViewController animated:TRUE];

}

-(void) deletePost: (NSString *) postIdentifier {
  
  
  [[[self.db collectionWithPath:@"posts"] documentWithPath:postIdentifier]
      deleteDocumentWithCompletion:^(NSError * _Nullable error) {
    
   NSString * message = @"";
    
        if (error != nil) {
          message = @"삭제에 실패했습니다 ㅠㅠ";
        } else {
          message = @"삭제에 성공했습니다!";
        }
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction* alertAction = [UIAlertAction actionWithTitle:@"확인" style: UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
   
    [alert addAction: alertAction];
    [[NSNotificationCenter defaultCenter]postNotificationName:PostListVCShouldFetchListNotification object:self];

    [self presentViewController:alert animated:YES completion:nil];

  }];
}


@end
