//
//  main.m
//  Obj-C-tutorial
//
//  Created by Jeff Jeong on 2023/01/02.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Pet.h"
#import "Cat.h"
int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
      
      
//      Pet * cat = [[Pet alloc] init];
//
//      [cat doCry: @"야옹"];
//
      Cat * cat1 = [[Cat alloc] init];
      Cat * cat2 = [[Cat alloc] initWithAge:0];
      Cat * cat3 = [[Cat alloc] initWithName:@"이름" age:3];
      
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
