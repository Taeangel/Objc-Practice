//
//  UIViewController+Popup.h
//  Obj-C SNS
//
//  Created by song on 2023/05/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Popup)

+(void)present:(UIViewController *)caller;

+(void)presentWithNavigation:(UIViewController *)caller;

@end

NS_ASSUME_NONNULL_END
