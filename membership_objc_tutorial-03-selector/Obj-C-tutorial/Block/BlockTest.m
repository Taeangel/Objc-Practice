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
    
    someBlockWithParam = ^(NSString * name){
      NSLog(@"%s , line: %dm %@",__func__, __LINE__, name);
    };
    
    someBlockWitMultihParam = ^(NSString * name, int age){
      NSLog(@"%s , line: %d, %@  age: %d",__func__, __LINE__, name, age);
    };
  }
  return self;
}

-(void)someFunction {
  NSLog(@"%s , line: %d, %@",__func__, __LINE__, @"");
  someBlock();
}

-(void)someFunctionWithParam:(NSString *)name {
  NSLog(@"%s , line: %d, %@",__func__, __LINE__, name);
  
  someBlockWithParam(name);
}

- (void)someFunctionWithMultiParam:(NSString *)name withAge:(int)age {
  NSLog(@"%s , line: %d, %@ age: %d",__func__, __LINE__, name, age);
  someBlockWitMultihParam(name, age);
}
@end
