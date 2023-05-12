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
  
  UIViewController * addPostvc = [storyboard instantiateViewControllerWithIdentifier:className];
  
  [addPostvc setModalPresentationStyle: UIModalPresentationFullScreen];
  
  [caller presentViewController:addPostvc animated:YES completion:nil];
}

@end
