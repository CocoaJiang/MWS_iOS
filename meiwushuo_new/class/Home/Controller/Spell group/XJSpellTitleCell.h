//
//  XJSpellTitleCell.h
//  meiwushuo_new
//
//  Created by pro on 2019/7/3.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJtableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface XJSpellTitleCell : XJtableViewCell
@property (weak, nonatomic) IBOutlet UILabel *teamCount;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *disLabel;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *marketPrice;
@property (weak, nonatomic) IBOutlet UILabel *orderTean;

@end

NS_ASSUME_NONNULL_END
