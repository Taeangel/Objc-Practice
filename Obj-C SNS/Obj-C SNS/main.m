//
//  main.m
//  Obj-C SNS
//
//  Created by song on 2023/05/11.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
  NSString * appDelegateClassName;
  @autoreleasepool {
      // Setup code that might create autoreleased objects goes here.
      appDelegateClassName = NSStringFromClass([AppDelegate class]);
  }  return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
