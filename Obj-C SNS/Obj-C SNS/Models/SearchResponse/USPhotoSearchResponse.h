//
//  USPhotoSearchResponse.h
//  Obj-C SNS
//
//  Created by song on 2023/05/13.
//

#import <Foundation/Foundation.h>
#import "USPhoto.h"

NS_ASSUME_NONNULL_BEGIN

@interface USPhotoSearchResponse : NSObject

@property (nonatomic, assign ) NSInteger total;
@property (nonatomic, assign ) NSInteger totalPages;
@property (nonatomic, nullable, copy) NSMutableArray<USPhoto*> * result;

-(id) initWithDictionary:(NSDictionary<NSString* , id> *) jsonDictionary;
@end

NS_ASSUME_NONNULL_END
