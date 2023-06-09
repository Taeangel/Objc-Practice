//
//  PostTableViewCell.m
//  Obj-C SNS
//
//  Created by song on 2023/05/12.
//

#import "PostTableViewCell.h"

@implementation PostTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
  [self initSetting];
}

- (void)initSetting {
  _postImageView.contentMode = UIViewContentModeScaleAspectFill;
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//  
//  NSLog(@"%s , line: %d, %@", __func__, __LINE__, @"눌리나!!");
//}

- (void)configureCell:(Post *)cellData {
  
  [_postImageView sd_setImageWithURL:[NSURL URLWithString:cellData.image]
               placeholderImage:[UIImage systemImageNamed:@"photo.artframe"]];
  
  NSString * titleString = [@"title: " stringByAppendingString:cellData.title];
  [_title setText:titleString];
  
  NSString * contentString = [@"content: " stringByAppendingString:cellData.content];
  [_content setText:contentString];
  
  NSString * createdAtString = [@"등록일: " stringByAppendingString: [cellData.createdAt toString]];
  [_createdAt setText:createdAtString];

  NSString * updateAtString = [@"수정일: " stringByAppendingString: [cellData.updatedAt toString]];
  [_updatedAt setText:updateAtString];
}

@end
