//
//  ViewController.m
//  Obj-C-tutorial
//
//  Created by Jeff Jeong on 2023/01/02.
//

#import "ViewController.h"
#import "Friend.h"
#import "Friend+info.h"
#import "NSDate+Helpers.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  //MARK: SEL
//  SEL btnSelector = @selector(onTestBtnClicked:);
//
//
//  [_selectorTestButton addTarget:self action:btnSelector forControlEvents:UIControlEventTouchUpInside];
  
  //MARK: 함수 id
//  Friend *createdFriend = [Friend getAFriend];
//
//  NSLog(@"createdFriend닉네임: %@", [createdFriend nickname]);
//
//  Friend *createdMyFriend = [Friend getAMyFriend];
//
//  NSLog(@"createdFriend닉네임: %@", [createdMyFriend nickname]);
  
  //MARK: 함수
//  [self sayHello];
//
//  int randomNumber = [self getRandomNumber];
//
//  NSLog(@"%@", @(randomNumber).stringValue);
//
//  [self saySomthingWithParam: 3];
//
//  [self saySomthingWithMultiParam:100 :@"캬"];
  
  //MARK: getter setter
//  // 헤더에 프로퍼티로 설정하면 기본구현으로 set을 제공해준다
//  Friend * aFriend = [[Friend alloc] init];
//
//  [aFriend setNickname:@"히하"];
//  // 그냥 사용하면 get
//  NSLog(@"%@", [aFriend nickname]);
//
//  [aFriend setNickname:@"요롤롤로"];
//  NSLog(@"%@", [aFriend nickname]);
  
  //MARK: 카테고리 extension 같은거임
//  Friend * aFriend = [[Friend alloc] init];
//  
//  [aFriend setNickname:@"닉네임 정했어"];
//  
//  NSLog(@"카테고리에 있는 함수로 정보가져오기 %@", [aFriend getInfo]);
//  
//  NSDate * today = [NSDate date];
//  
//  NSDate * yesterday = [NSDate dateWithTimeIntervalSinceNow: -(60.0f*60.0f*24.0f)];
//  
//  NSLog([yesterday isToday] ? @"오늘입니다": @"아닙니다");
  
}


- (void)onTestBtnClicked:(UIButton *) sender {
  NSLog(@"name: %@, btnTitle: %@ ", NSStringFromSelector(_cmd), sender.titleLabel.text);
}

// 내부에서만 사용될 거기 떄문에 따로 헤더 파일에 생성 하지 않아도 됩니다!

// 매개변수 X 반환 X
- (void) sayHello {
  NSLog(@"안녕하세요????");
}


// 매개변수 X 반환 O
- (int) getRandomNumber {
//  NSLog(@"%@", NSStringFromSelector(_cmd));
  
  // 0 ~99 무작위
  return  arc4random_uniform(100);
}

// 원시 자료형도 있지만 오브젝티브 씨에서만 제공하는 number에 대한 자료형이 NSInteger 이다.

- (void)saySomthingWithParam: (NSInteger) number {
  // 숫자는 d로 해야 된다
  NSLog(@"number: %d", number);
}
                                                         // string 는 힙에 들어가기떄문에
- (void)saySomthingWithMultiParam: (NSInteger) number : (NSString *) str {
  // 숫자는 d로 해야 된다
  NSLog(@"number: %d str: %@ ", number, str);
}

@end
