//
//  SeletetUnsplashPhothViewController.m
//  Obj-C SNS
//
//  Created by song on 2023/05/12.
//

#import "SeletetUnsplashPhothViewController.h"

@interface SeletetUnsplashPhothViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *photoSearchBar;
@property (strong, nullable) dispatch_block_t debounceSearchInputTask;
@end

@implementation SeletetUnsplashPhothViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
  
  dispatch_block_t task = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, ^{
    NSLog(@"%s , line: %d,디바운스된 글자 %@", __func__, __LINE__, searchText);
  });
  
  _debounceSearchInputTask = task;
  
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.7 * NSEC_PER_SEC), dispatch_get_main_queue(), task);
   
}


@end
