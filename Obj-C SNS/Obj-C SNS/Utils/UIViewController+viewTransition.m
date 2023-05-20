//
//  UIViewController+viewTransition.m
//  Obj-C SNS
//
//  Created by song on 2023/05/15.
//

#import "UIViewController+viewTransition.h"

@implementation UIViewController (viewTransition)

+(id)pushViewController {
  
  NSString * className = NSStringFromClass([self class]);
  
  UIStoryboard * storyboard = [UIStoryboard storyboardWithName:className bundle:nil];
  
  UIViewController * vc = [storyboard instantiateViewControllerWithIdentifier:className];
  
  return vc;
}

@end
