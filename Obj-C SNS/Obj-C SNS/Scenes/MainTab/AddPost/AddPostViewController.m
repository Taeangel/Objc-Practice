//
//  AddPostViewController.m
//  Obj-C SNS
//
//  Created by song on 2023/05/12.
//

#import "AddPostViewController.h"

@interface AddPostViewController () {
  NSString * _selectedImgUrlString;
}

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
  _postImageView.contentMode = UIViewContentModeScaleAspectFill;
  _contentTextField.text = @"메세지를 입력하세요";
  _contentTextField.textColor = [UIColor lightGrayColor];
  _contentTextField.delegate = self;
}

// MARK: IBActions

- (IBAction)onDismissBtnClicked:(UIButton *)sender {
  
  [self dismissViewControllerAnimated:TRUE completion:nil];
}
- (IBAction)onAddPostBtnClicked:(UIButton *)sender {
  
  __weak AddPostViewController * weakSelf = self;
  
  NSString * titleInput = _titleTestField.text ? : @"";
  NSString * contentInput = _contentTextField.text ? : @"";
  
  [self addPostWithTitle:titleInput
             withContent:contentInput
            withImageUrl: _selectedImgUrlString ? : @""
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
      strongSelf->_selectedImgUrlString = selectedUrl;
      [strongSelf->_postImageView sd_setImageWithURL:imgUrl];
    }
  };
}

// MARK: 인스턴스 메서드
-(void) addPostWithTitle: (NSString * )title
             withContent: (NSString *) content
            withImageUrl: (NSString *) imageUrlString
          withCompletion: (void(^)(void)) completion// 첫번째 보이드가 반환 두번쨰 보이드가 매개변수
{
  FIRDocumentReference * newPostRef = [[self.db collectionWithPath:@"posts"] documentWithAutoID];
  
  NSDictionary *newPostDictionary = @{
    @"identifier": newPostRef.documentID,
    @"title": title,
    @"content": content,
    @"image": imageUrlString,
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

- (void)textViewDidBeginEditing:(UITextView *)textView {
  if (textView.textColor == [UIColor lightGrayColor]) {
    textView.text = @"";
    textView.textColor = [UIColor blackColor];
  };
}

- (void)textViewDidEndEditing:(UITextView *)textView {
  if (textView.text.length == 0) {
    textView.text = @"메세지를 입력하세요";
    textView.textColor = [UIColor lightGrayColor];
  }
}

@end
