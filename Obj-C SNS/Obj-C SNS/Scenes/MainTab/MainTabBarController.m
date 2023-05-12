//
//  MainTabBarController.m
//  Obj-C SNS
//
//  Created by song on 2023/05/12.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  self.delegate = self;
}
// MARK: UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
  if ([viewController isKindOfClass: [AddPostViewController class]]) {
    
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"AddPostViewController" bundle:nil];
    
   UIViewController * addPostvc = [storyboard instantiateViewControllerWithIdentifier:@"AddPostViewController"];
    
    [addPostvc setModalPresentationStyle: UIModalPresentationFullScreen];
    
    [self presentViewController:addPostvc animated:YES completion:nil];
    
    return  NO;
  }
  return YES;
}


@end
