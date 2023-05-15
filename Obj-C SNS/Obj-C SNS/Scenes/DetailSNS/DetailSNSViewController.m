//
//  DetailSNSViewController.m
//  Obj-C SNS
//
//  Created by song on 2023/05/15.
//

#import "DetailSNSViewController.h"

@interface DetailSNSViewController () {
  Post * _post;
}

@end

@implementation DetailSNSViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self initSetting];
}

-(void) initSetting {
  _post = _interfacePost;
  self.navigationItem.title = _post.title;
}

- (IBAction)onDeleteBtnClicked:(id)sender {
  
}


- (IBAction)onModifyPostBtnClicked:(id)sender {
  
}
@end
