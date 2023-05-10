//
//  Pet.m
//  Obj-C-tutorial
//
//  Created by song on 2023/05/10.
//

#import "Pet.h"

// MARK: classExtension
// 이렇게 되어 있으면 이건 클래스 내부에서만 사용이 가능합니다!
// 클래스 익스텐션을 통해 내부적으로 프로퍼티를 재선언 해서 변경이 가능합니다 추가로 사용할 함수나 변수를 선언 할 수 있습니다.
@interface Pet ()
{
  // 클래스 내부에서만 사용할 프로퍼티
  NSNumber * age;
}
// 이렇게 재선언을 하면 클래스 내부에서는 readwrite 로 사용이 가능하다 안쓰면 디폴트가 readwrite이다
@property (readwrite, copy) NSString * name;

@end

@implementation Pet

- (id)init {
  self = [super init];
  
  if (self) {
    age = [NSNumber numberWithInt: 3];
  }
  
  return  self;
  
}

- (void)doCry: name {
  
  [self setName: name];
  
  NSLog(@"doCry: %@ name: %@", self.name, age);
}


@end
