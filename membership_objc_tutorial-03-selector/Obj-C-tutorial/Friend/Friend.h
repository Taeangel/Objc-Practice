//
//  Friend.h
//  Obj-C-tutorial
//
//  Created by Jeff Jeong on 2023/01/02.
//

#ifndef Friend_h
#define Friend_h
#import <UIKit/UIKit.h>


@interface Friend : NSObject

// 외부에서 접근 가능한 녀석들 - 맴버 변수
@property NSString *nickname;


// 인스턴스 메소드 - 객채 생성후 그 녀석이 가지고 있는 메소드
- (void)sayHello;

// 클래스 메소드 - 객체 생성 X - 스태틱 메소드
+ (void)sayGoodbye;

// 
+ (id)getAFriend;

+ (Friend *)getAMyFriend;
@end


#endif /* Friend_h */
