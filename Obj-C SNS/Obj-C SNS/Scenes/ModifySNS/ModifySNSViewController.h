//
//  ModifySNSViewController.h
//  Obj-C SNS
//
//  Created by song on 2023/05/15.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "SeletetUnsplashPhothViewController.h"
#import "UIViewController+Popup.h"
#import "Constant.h"

@import FirebaseCore;
@import FirebaseFirestore;

NS_ASSUME_NONNULL_BEGIN

@interface ModifySNSViewController : UIViewController<UIGestureRecognizerDelegate>

@property Post * interfacePost;

@end

NS_ASSUME_NONNULL_END
