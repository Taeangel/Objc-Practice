//
//  NSDate+Helpers.m
//  Obj-C SNS
//
//  Created by song on 2023/05/12.
//

#import "NSDate+Helpers.h"

@implementation NSDate (Helpers)

- (NSString *)toString {
  NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
  
  [formatter setDateFormat:@"YYYY-MM-DD HH:mm:ss"];
  
  NSString * dateString = [formatter stringFromDate: self];
  
  return  dateString;
}
@end
