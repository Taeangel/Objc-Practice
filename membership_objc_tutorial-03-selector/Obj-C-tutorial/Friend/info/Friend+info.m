//
//  Friend+info.m
//  Obj-C-tutorial
//
//  Created by song on 2023/05/10.
//

#import "Friend+info.h"

@implementation Friend (info)

- (NSString *) getInfo {
  
  NSString * info = [NSString stringWithFormat:@"친구이름: %@", self.nickname];

  return info;
}
@end
