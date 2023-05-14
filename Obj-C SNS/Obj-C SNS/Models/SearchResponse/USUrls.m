//
//  USUrls.m
//  Obj-C SNS
//
//  Created by song on 2023/05/13.
//

#import "USUrls.h"

@implementation USUrls

- (id) initWithDictionary:(NSDictionary<NSString*, id> *) jsonDictionary {
  
  self = [super init];
  
  if (self) {
    _regular = jsonDictionary[@"regular"] ?: @"";
    _small = jsonDictionary[@"small"] ?: @"";
    _full = jsonDictionary[@"full"] ?: @"";
  }
  
  return  self;
};
@end
