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
  self.delegate = self;
}
// MARK: UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
  if ([viewController isKindOfClass: [AddPostViewController class]]) {
    
    [AddPostViewController present: self];
    
    return  NO;
  }
  return YES;
}

@end
