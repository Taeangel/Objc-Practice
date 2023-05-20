//
//  ModifySNSViewController.m
//  Obj-C SNS
//
//  Created by song on 2023/05/15.
//

#import "ModifySNSViewController.h"
@import SDWebImage;

@interface ModifySNSViewController (){
  NSString * _imageStr;
  Post * _post;
}
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet UITextField *postTitleTextField;
@property (weak, nonatomic) IBOutlet UITextView *postContentTextField;
@property (weak, nonatomic, nullable) FIRFirestore * db;


@end

@implementation ModifySNSViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self initSetting];
}


- (IBAction)onModifyBtnClicked:(id)sender {
  
  
  NSString * message = @"정말로 수정하시겠습니까?";
    
  UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle: UIAlertControllerStyleActionSheet];
  
  UIAlertAction* noAction = [UIAlertAction actionWithTitle:@"아닙니다!" style: UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
  
  __weak ModifySNSViewController * weakSelf = self;
  
  UIAlertAction* yesAction  = [UIAlertAction actionWithTitle:@"네 수정하겠습니다!" style: UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
    [self editPost];
    [self.navigationController popViewControllerAnimated:TRUE];
  }];
  
  [alert addAction:noAction];
  [alert addAction:yesAction];

  [self presentViewController:alert animated:YES completion:nil];
}

- (void) initSetting {
  _post = _interfacePost;
  
  [_postImageView sd_setImageWithURL:[NSURL URLWithString:_post.image]
                    placeholderImage:[UIImage systemImageNamed:@"photo.artframe"]];
  
  _postTitleTextField.text = _post.title;
  _postContentTextField.text = _post.content;
  
  self.db = [FIRFirestore firestore];
  
}

-(void) editPost {
  NSDictionary * updatedPostDictionary = @{
    @"title": _postTitleTextField.text,
    @"content": _postContentTextField.text,
    @"image": _imageStr,
    @"updated_at": [FIRTimestamp timestampWithDate:[NSDate date]]
  };
  
  FIRDocumentReference * postUpdateRef = [[_db collectionWithPath:@"posts"] documentWithPath:_post.identifier];
  
  [postUpdateRef updateData: updatedPostDictionary completion:^(NSError * _Nullable error) {
    if (error != nil) {
      NSLog(@"Error updating document: %@", error);
    } else {
      NSLog(@"Document successfully updated");
    }
    
    [[NSNotificationCenter defaultCenter]postNotificationName:PostListVCShouldFetchListNotification object:self];
    [[NSNotificationCenter defaultCenter]postNotificationName:EditPostNotification object:self];

  }];
}

-(void) asdf {
 
}

// MARK: TapGesture
- (IBAction)imgButtonClicked:(id)sender {
  __weak ModifySNSViewController * weakSelf = self;
  
  SeletetUnsplashPhothViewController * selectPhotoVC = (SeletetUnsplashPhothViewController *) [SeletetUnsplashPhothViewController presentWithNavigationAndReturnVC:self];
  
  selectPhotoVC.photoSelectionBlock = ^(NSString * selectedUrl) {
    NSLog(@"%s , line: %d, %@", __func__, __LINE__, selectedUrl);
    ModifySNSViewController * strongSelf = weakSelf;
    if (strongSelf) {
      NSURL * imgUrl = [[NSURL alloc] initWithString: selectedUrl];
      strongSelf->_imageStr = selectedUrl;
      [strongSelf->_postImageView sd_setImageWithURL:[NSURL URLWithString: selectedUrl]];
    }
  };
}

@end
