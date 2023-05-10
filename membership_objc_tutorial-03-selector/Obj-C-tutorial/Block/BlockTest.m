//
//  BlockTest.m
//  Obj-C-tutorial
//
//  Created by song on 2023/05/10.
//

#import "BlockTest.h"

@implementation BlockTest


- (instancetype)init
{
  self = [super init];
  if (self) {
    someBlock = ^{
      
      NSLog(@"%s , line: %dm %@",__func__, __LINE__, @"someBlock호출");
    };
  }
  return self;
}

-(void)someFunction {
  NSLog(@"%s , line: %dm %@",__func__, __LINE__, @"");
  someBlock();
}

@end
