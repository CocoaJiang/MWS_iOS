//
//  XJHomeGoodsCell.h
//  meiwushuo_new
//
//  Created by pro on 2019/7/2.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,XJGoodscollectionViewType){
    XJHome=0,
    XJSPellGroup=1,
};



NS_ASSUME_NONNULL_BEGIN

@interface XJHomeGoodsCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *monkey;
@property (weak, nonatomic) IBOutlet UIButton *detailButton;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property(assign,nonatomic)XJGoodscollectionViewType type;

@end

NS_ASSUME_NONNULL_END
