//
//  XJGoodDetailBigCell.h
//  meiwushuo_new
//
//  Created by pro on 2019/7/2.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XJGoodDetailBigCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *marketPrice;
@property (weak, nonatomic) IBOutlet UIButton *gobuybutton;

@end

NS_ASSUME_NONNULL_END
