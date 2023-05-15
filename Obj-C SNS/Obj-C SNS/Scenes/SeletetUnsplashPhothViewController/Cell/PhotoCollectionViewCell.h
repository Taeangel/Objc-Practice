//
//  PhotoCollectionViewCell.h
//  Obj-C SNS
//
//  Created by song on 2023/05/13.
//

#import <UIKit/UIKit.h>
#import "USPhoto.h"
@import  SDWebImage;

NS_ASSUME_NONNULL_BEGIN

@interface PhotoCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIImageView *checkImageView;
@property (weak, nonatomic, nullable) USPhoto * cellData;

+ (NSString*) cellReuseIdentifier;


- (void) configureCell:(USPhoto *) cellData selected: (NSString *) selectedImgUrlString;
@end

NS_ASSUME_NONNULL_END
