//
//  XJSpellTitleCell.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/3.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJSpellTitleCell.h"

@implementation XJSpellTitleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.title.font = [UIFont systemFontOfSize:15];
    self.title.textColor = KTEXTCOLOR;
    self.disLabel.font  = [UIFont systemFontOfSize:12];
    self.disLabel.textColor = KTEXTGRAYCOLOR;
    self.price.font  = [UIFont fontWithName:DINAFONT size:30];
    self.marketPrice.textColor = KTEXTGRAYCOLOR;
    self.orderTean.textColor = rgba(237, 132, 23, 1);
    self.orderTean.font = [UIFont systemFontOfSize:11];
    self.price.textColor = RGBA(235, 9, 9, 1);
    self.marketPrice.attributedText = [Tools returnPriceMedicLineWithString:@"999"];
    }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
