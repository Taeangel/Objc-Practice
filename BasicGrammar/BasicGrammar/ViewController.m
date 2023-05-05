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
  
  SEL btnSelector = @selector(onTestBtnClicked:);
  
  [_selecterTest addTarget: self action: btnSelector forControlEvents:UIControlEventTouchUpInside];

}

- (void)onTestBtnClicked:(UIButton *) sender {
  NSLog(@"name: %@, btnTitle: %@", NSStringFromSelector(_cmd), sender.titleLabel.text);
}

@end
