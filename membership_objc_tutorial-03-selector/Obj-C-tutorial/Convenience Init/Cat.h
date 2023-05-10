//
//  Cat.h
//  Obj-C-tutorial
//
//  Created by song on 2023/05/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Cat : NSObject {
  NSString * name;
  int age;
}

- (id) initWithName:(NSString *)nameValue;
- (id) initWithAge:(int)ageValue;
- (id) initWithName: (NSString *) nameValue age:(int)ageValue NS_SWIFT_NAME(initWithNameAndAge(nameValue:ageValue:));
@end

NS_ASSUME_NONNULL_END
