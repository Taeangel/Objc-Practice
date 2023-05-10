//
//  main.m
//  Obj-C-tutorial
//
//  Created by Jeff Jeong on 2023/01/02.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Pet.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
      
      
      Pet * cat = [[Pet alloc] init];
      
      [cat doCry: @"야옹"];
      
      
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
