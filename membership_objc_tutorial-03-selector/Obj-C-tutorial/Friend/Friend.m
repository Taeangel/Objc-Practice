//
//  Friend.m
//  Obj-C-tutorial
//
//  Created by Jeff Jeong on 2023/01/02.
//

#import <Foundation/Foundation.h>
#import "Friend.h"

// 클래스 확장 - 클래스 안에서 사용
@interface Friend ()
{
    NSString *_name;
}
@end

// 구현부
@implementation Friend

- (void)sayHello{
    
    self->_name = @"호롤롤로";
    
    self->_nickname = @"쩡대리";
    
    NSLog(@"안녕하세요?!?! %@", self->_name);
}

+ (void)sayGoodbye {
    NSLog(@"잘가요!!");
}

+ (id)getAFriend {

  Friend *aFriend = [[Friend alloc] init];

  [aFriend setNickname: @"id 호출"]; // setter

  return aFriend;
}

+ (Friend *)getAMyFriend {
  Friend *aFriend = [[Friend alloc] init];

  [aFriend setNickname: @"Friend * 호출"]; // setter

  return aFriend;
}

@end
