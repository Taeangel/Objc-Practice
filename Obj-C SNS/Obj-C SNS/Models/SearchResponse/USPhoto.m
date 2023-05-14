//
//  USPhoto.m
//  Obj-C SNS
//
//  Created by song on 2023/05/13.
//

#import "USPhoto.h"

@implementation USPhoto

- (id) initWithDictionary:(NSDictionary<NSString*, id> *) jsonDictionary {
  
  self = [super init];
  
  if (self) {
    _idenditfier = jsonDictionary[@"id"] ?: @"";
    _urls = [[USUrls alloc] initWithDictionary:jsonDictionary[@"urls"]];
  }
  
  return  self;
};

@end
