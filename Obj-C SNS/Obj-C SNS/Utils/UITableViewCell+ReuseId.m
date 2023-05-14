//
//  UITableViewCell+ReuseId.m
//  Obj-C SNS
//
//  Created by song on 2023/05/13.
//

#import "UITableViewCell+ReuseId.h"

@implementation UITableViewCell (ReuseId)

+ (NSString*) cellReuseIdentifier {
  return NSStringFromClass([self class]);
}

@end
