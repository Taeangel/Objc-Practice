//
//  Pet.h
//  Obj-C-tutorial
//
//  Created by song on 2023/05/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Pet : NSObject

@property (readonly, copy) NSString * name;

- (void) doCry: (NSString *) name;

@end

NS_ASSUME_NONNULL_END
