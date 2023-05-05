//
//  ViewController.m
//  BasicGrammar
//
//  Created by song on 2023/05/03.
//

#import "ViewController.h"

@interface ViewController ()

@end
@implementation ViewController

- (void)viewDidLoad {
  
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  
  BOOL isDark = YES;
  BOOL isLight = YES;
    
  if (!isDark) {
    NSLog(@"다크모드입니다!! %@", isDark ? @"다크" : @"라이트");
  } else {

    NSLog(@"라이모드입니다!! %@", isDark ? @"다크" : @"라이트");
  }
}

@end
