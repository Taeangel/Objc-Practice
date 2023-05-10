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
  
  void (^someBlockWithParam) (NSString *);
  void (^someBlockWitMultihParam) (NSString *, int);
}

- (void)someFunction;

- (void)someFunctionWithParam: (NSString *)name;

- (void)someFunctionWithMultiParam: (NSString *)name withAge: (int) age;
@end

NS_ASSUME_NONNULL_END
