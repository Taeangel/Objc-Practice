//
//  ViewController.h
//  Obj-C SNS
//
//  Created by song on 2023/05/11.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "PostTableViewCell.h"
#import "Constant.h"
#import "UITableViewCell+ReuseId.h"

@import FirebaseCore;
@import FirebaseFirestore;

@interface PostListViewController : UIViewController <UITableViewDataSource>


@end

