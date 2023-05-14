//
//  SeletetUnsplashPhothViewController.h
//  Obj-C SNS
//
//  Created by song on 2023/05/12.
//

#import <UIKit/UIKit.h>
#import "USPhotoSearchResponse.h"
#import "PhotoCollectionViewCell.h"
#import "UICollectionViewCell+ReuseId.h"

NS_ASSUME_NONNULL_BEGIN

@interface SeletetUnsplashPhothViewController : UIViewController<UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

NS_ASSUME_NONNULL_END
