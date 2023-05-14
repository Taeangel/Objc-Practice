//
//  PostTableViewCell.h
//  Obj-C SNS
//
//  Created by song on 2023/05/12.
//

#import <UIKit/UIKit.h>
#include "Post.h"
#import "NSDate+Helpers.h"

@import SDWebImage;

NS_ASSUME_NONNULL_BEGIN

@interface PostTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *postImageView;

@property (weak, nonatomic) IBOutlet UILabel *identifier;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *createdAt;
@property (weak, nonatomic) IBOutlet UILabel *updatedAt;

- (void)configureCell: (Post *) cellData;


@end

NS_ASSUME_NONNULL_END
