//
//  XJSpellTeamDetailCell.h
//  meiwushuo_new
//
//  Created by pro on 2019/7/6.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJtableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface XJSpellTeamDetailCell : XJtableViewCell
@property (weak, nonatomic) IBOutlet UILabel *orderNumber;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *total;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

NS_ASSUME_NONNULL_END
