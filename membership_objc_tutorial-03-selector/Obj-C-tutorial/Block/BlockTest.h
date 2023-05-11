//
//  BlockTest.h
//  Obj-C-tutorial
//
//  Created by song on 2023/05/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString * String;

typedef void(^DoneBlock)(NSString *);

@interface BlockTest : NSObject
{
  String myString;
  
  void (^someBlock)(void);
  void (^someBlockWithParam) (NSString *);
  void (^someBlockWitMultihParam) (NSString *, int);
}

- (void)someFunction;

- (void)someFunctionWithParam: (NSString *)name;

- (void)someFunctionWithMultiParam: (NSString *)name withAge: (int) age;

- (void)someFunctionWithBlockParam:(void(^)(NSString *))done;
//위에꺼랑 똑같은 역할을 한다.
- (void)someFunctionWithtypedef:(DoneBlock)done;
@end

NS_ASSUME_NONNULL_END
