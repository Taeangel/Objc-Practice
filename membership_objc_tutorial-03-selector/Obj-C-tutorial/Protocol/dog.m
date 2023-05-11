//
//  dog.m
//  Obj-C-tutorial
//
//  Created by song on 2023/05/11.
//

#import "dog.h"

@implementation dog

- (void)doCry {
  NSLog(@"%s , line: %d, %@",__func__, __LINE__, @"멍멍");
}

- (void)doMoreCry {
  NSLog(@"%s , line: %d, %@",__func__, __LINE__, @"멍멍멍");
}

@end
