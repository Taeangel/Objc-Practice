//
//  PhotoCollectionViewCell.m
//  Obj-C SNS
//
//  Created by song on 2023/05/13.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell

- (void)awakeFromNib {
  [super awakeFromNib];
  _photoImageView.sd_imageTransition = SDWebImageTransition.fadeTransition;
  _photoImageView.sd_imageIndicator = SDWebImageProgressIndicator.defaultIndicator;
  _photoImageView.contentMode = UIViewContentModeScaleAspectFill;
  [_checkImageView setHidden:YES];
}

+ (NSString*) cellReuseIdentifier {
  return  @"PhotoCollectionViewCell";
}


- (void) configureCell:(USPhoto *) cellData selected: (NSString *) selectedImgUrlString {
  NSLog(@"%s , line: %d, %@", __func__, __LINE__, cellData.idenditfier);
  
  _cellData = cellData;
  
  NSURL * imgUrl = [[NSURL alloc] initWithString:  cellData.urls.regular];
    
  [_photoImageView sd_setImageWithURL:imgUrl];
  
  BOOL isHidden = ![self isSelectedImage:selectedImgUrlString];
  
  [_checkImageView setHidden: isHidden];

}

-(BOOL)isSelectedImage: (NSString *) selectedImgUrlString {
  return  [selectedImgUrlString isEqualToString: _cellData.urls.regular];
}

@end
