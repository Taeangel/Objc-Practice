//
//  DetailSNSViewController.m
//  Obj-C SNS
//
//  Created by song on 2023/05/15.
//

#import "DetailSNSViewController.h"
@import SDWebImage;

@interface DetailSNSViewController () {
  Post * _post;
}
@property (weak, nonatomic) IBOutlet UILabel *postId;
@property (weak, nonatomic) IBOutlet UILabel *postTitle;
@property (weak, nonatomic) IBOutlet UILabel *postContent;
@property (weak, nonatomic) IBOutlet UILabel *postCreatedAt;
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;

@end

@implementation DetailSNSViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self initSetting];
}

-(void) initSetting {
  _post = _interfacePost;
  
  [_postImageView sd_setImageWithURL:[NSURL URLWithString:_post.image]
               placeholderImage:[UIImage systemImageNamed:@"photo.artframe"]];
  
  _postId.text = [@"id: " stringByAppendingString: _post.identifier];
  _postTitle.text = [@"title: " stringByAppendingString: _post.title];
  _postContent.text = [@"content: " stringByAppendingString: _post.content];
  _postCreatedAt.text = [@"createdAt: " stringByAppendingString: [_post.createdAt toString]];
  
  self.navigationItem.title = _post.title;
  
}

- (IBAction)onDeleteBtnClicked:(id)sender {
  
}


- (IBAction)onModifyPostBtnClicked:(id)sender {
  
}


@end
