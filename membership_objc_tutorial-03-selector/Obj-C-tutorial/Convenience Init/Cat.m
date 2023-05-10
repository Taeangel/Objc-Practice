//
//  Cat.m
//  Obj-C-tutorial
//
//  Created by song on 2023/05/10.
//

#import "Cat.h"

@implementation Cat

- (id)init
{
  self = [super init];
  if (self) {
    age = 0;
    name = @"이름없음";
  }
  return self;
}

- (id)initWithAge:(int)ageValue {
  self = [super init];
  if (self) {
    age = ageValue;
    name = @"이름없음";
  }
  return self;
}

- (id)initWithName:(NSString *)nameValue {
  self = [super init];
  if (self) {
    age = 0;
    name = nameValue;
  }
  return self;
}

- (id)initWithNameAndAge: (NSString *)nameValue age: (int) ageValue {
  self = [super init];
  if (self) {
    name = nameValue;
    age = ageValue;
  }
  return self;
}

@end
