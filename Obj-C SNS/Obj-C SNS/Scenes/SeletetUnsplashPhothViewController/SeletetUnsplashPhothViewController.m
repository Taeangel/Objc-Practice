//
//  SeletetUnsplashPhothViewController.m
//  Obj-C SNS
//
//  Created by song on 2023/05/12.
//

#import "SeletetUnsplashPhothViewController.h"

@interface SeletetUnsplashPhothViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *photoSearchBar;

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
  NSLog(@"%s , line: %d, %@", __func__, __LINE__, searchText);
  
  
}


@end
