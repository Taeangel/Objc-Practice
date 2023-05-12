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
}

// MARK: IBActions

- (IBAction)onDismissBtnClicked:(UIButton *)sender {
  
  [self dismissViewControllerAnimated:TRUE completion:nil];
}
- (IBAction)onAddPostBtnClicked:(UIButton *)sender {
  NSLog(@"%s , line: %d, %@", __func__, __LINE__, @"포스트 버튼 클릭");
  
  NSString * titleInput = _titleTestField.text ? : @"";
  NSString * contentInput = _contentTextField.text ? : @"";
  
  [self addPostWithTitle:titleInput withContent:contentInput];
}

- (IBAction)onPhotoSelectBtnClicked:(UIButton *)sender {
  NSLog(@"%s , line: %d, %@", __func__, __LINE__, @"사진선택 클릭");
}

// MARK: 인스턴스 메서드
-(void) addPostWithTitle:(NSString * )title withContent: (NSString *) content {
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
      NSLog(@"포스팅 추가 성공 - refId: %@", newPostRef.documentID);
    }
  }];
  
}




@end
