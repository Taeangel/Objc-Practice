//
//  ViewController.m
//  ObjcPractice
//
//  Created by song on 2023/03/27.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  
  BOOL isDark = YES;
  BOOL isLight = NO;

  if (!isDark) {
    NSLog(@"다크모드입니다!? %@", isDark ? @"TRUE" : @"False");
  } else {
    NSLog(@"라이트모드입니다!? %@", isLight ? @"TRUE" : @"False");
  }
}



@end
