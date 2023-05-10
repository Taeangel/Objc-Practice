//
//  BlockTest.h
//  Obj-C-tutorial
//
//  Created by song on 2023/05/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlockTest : NSObject
{
  void (^someBlock)(void);
}

- (void)someFunction;
@end

NS_ASSUME_NONNULL_END
