//
//  NSDate+Helpers.m
//  Obj-C-tutorial
//
//  Created by song on 2023/05/10.
//

#import "NSDate+Helpers.h"

@implementation NSDate (Helpers)

- (BOOL)isToday {
  BOOL isToday = [[NSCalendar currentCalendar] isDateInToday: self];
  
  return isToday;
}
@end
