//
//  UICollectionViewCell+ReuseId.m
//  Obj-C SNS
//
//  Created by song on 2023/05/13.
//

#import "UICollectionViewCell+ReuseId.h"

@implementation UICollectionViewCell (ReuseId)

+ (NSString*) cellReuseIdentifier {
  return NSStringFromClass([self class]);
}
@end
