//
//  XJOnFreeGoodsCell.h
//  meiwushuo_new
//
//  Created by pro on 2019/7/2.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJtableViewCell.h"

typedef NS_ENUM(NSInteger,CellType){
    FreeBuy=0,
    SpellGroup=1,
    MakeORderDetail=2,
};

NS_ASSUME_NONNULL_BEGIN



@interface XJOnFreeGoodsCell : XJtableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *inventory;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (weak, nonatomic) IBOutlet UILabel *marketPrice;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inventoryCenter;
@property (weak, nonatomic) IBOutlet UILabel *inventory2;



@property(assign,nonatomic)CellType type;
@end

NS_ASSUME_NONNULL_END
