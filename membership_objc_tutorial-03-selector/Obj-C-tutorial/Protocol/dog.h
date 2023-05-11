//
//  dog.h
//  Obj-C-tutorial
//
//  Created by song on 2023/05/11.
//

#import <Foundation/Foundation.h>
#import "MyPet.h"
NS_ASSUME_NONNULL_BEGIN

@protocol DogDelegate <NSObject>

- (void)doMoreCry;

@end

@interface dog : NSObject <MyPet, DogDelegate>
{
  
}
@end

NS_ASSUME_NONNULL_END
