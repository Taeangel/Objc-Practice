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
  [self editPost];
}

- (void) initSetting {
  _post = _interfacePost;
  
  [_postImageView sd_setImageWithURL:[NSURL URLWithString:_post.image]
                    placeholderImage:[UIImage systemImageNamed:@"photo.artframe"]];
  
  _postTitleTextField.text = _post.title;
  _postContentTextField.text = _post.content;
  
  self.db = [FIRFirestore firestore];
  
  [self setTapGesture];
}

-(void) editPost {
  NSDictionary * updatedPostDictionary = @{
    @"title": _postTitleTextField.text,
    @"content": _postContentTextField.text,
    @"updated_at": [FIRTimestamp timestampWithDate:[NSDate date]]
  };
  
  FIRDocumentReference * postUpdateRef = [[_db collectionWithPath:@"posts"] documentWithPath:_post.identifier];
  
  [postUpdateRef updateData: updatedPostDictionary completion:^(NSError * _Nullable error) {
    NSLog(@"%s , line: %d, %@", __func__, __LINE__, error.description);
    if (error != nil) {
      NSLog(@"Error updating document: %@", error);
    } else {
      NSLog(@"Document successfully updated");
    }
  }];
}

-(void) asdf {
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

// MARK: TapGesture

-(void) setTapGesture {
  UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
  [_postContentTextField addGestureRecognizer: tapGestureRecognizer];
  tapGestureRecognizer.delegate = self;
}

-(void) handleTapGesture: (UITapGestureRecognizer *)recognizer {
  NSLog(@"%s , line: %d, %@", __func__, __LINE__, @"찍힘?");
}

@end
