//
//  USPhoto.h
//  Obj-C SNS
//
//  Created by song on 2023/05/13.
//

#import <Foundation/Foundation.h>
#import "USUrls.h"
NS_ASSUME_NONNULL_BEGIN

@interface USPhoto : NSObject

@property (nonatomic, nullable, copy) NSNumber* idenditfier;
@property (nonatomic, nullable, copy) USUrls* urls;

- (id) initWithDictionary:(NSDictionary<NSString*, id> *) jsonDictionary;

@end

NS_ASSUME_NONNULL_END
