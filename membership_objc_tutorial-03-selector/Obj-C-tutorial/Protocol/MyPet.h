//
//  MyPet.h
//  Obj-C-tutorial
//
//  Created by song on 2023/05/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MyPet <NSObject>

- (void)doCry;
@optional - (void)saySomthing;

@end

NS_ASSUME_NONNULL_END
