//
//  DetailSNSViewController.h
//  Obj-C SNS
//
//  Created by song on 2023/05/15.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "NSDate+Helpers.h"
#import "ModifySNSViewController.h"
#import "Constant.h"


@import FirebaseCore;
@import FirebaseFirestore;

NS_ASSUME_NONNULL_BEGIN

@interface DetailSNSViewController : UIViewController

@property Post * interfacePost;

@end

NS_ASSUME_NONNULL_END
