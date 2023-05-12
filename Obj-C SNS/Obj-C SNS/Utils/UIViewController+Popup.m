//
//  UIViewController+Popup.m
//  Obj-C SNS
//
//  Created by song on 2023/05/12.
//

#import "UIViewController+Popup.h"

@implementation UIViewController (Popup)

+ (void)present:(UIViewController *)caller {
  
  NSString * className = NSStringFromClass([self class]);
  
  UIStoryboard * storyboard = [UIStoryboard storyboardWithName:className bundle:nil];
  
  UIViewController * popVc = [storyboard instantiateViewControllerWithIdentifier:className];
  
  [popVc setModalPresentationStyle: UIModalPresentationFullScreen];
  
  [caller presentViewController:popVc animated:YES completion:nil];
}

+ (void)presentWithNavigation:(UIViewController *)caller {
  
  NSString * className = NSStringFromClass([self class]);
  
  UIStoryboard * storyboard = [UIStoryboard storyboardWithName:className bundle:nil];
  
  UIViewController * popVc = [storyboard instantiateViewControllerWithIdentifier:className];
  
  UINavigationController * navController = [[UINavigationController alloc] initWithRootViewController:popVc];
  
  
  [navController setModalPresentationStyle: UIModalPresentationFullScreen];
  
  [caller presentViewController:navController animated:YES completion:nil];
}
@end
