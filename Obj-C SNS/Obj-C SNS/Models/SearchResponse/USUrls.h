//
//  USUrls.h
//  Obj-C SNS
//
//  Created by song on 2023/05/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface USUrls : NSObject
@property (nonatomic, nullable, copy) NSString* regular;
@property (nonatomic, nullable, copy) NSString* small;
@property (nonatomic, nullable, copy) NSString* full;

- (id) initWithDictionary:(NSDictionary<NSString*, id> *) jsonDictionary;
@end

NS_ASSUME_NONNULL_END
