//
//  XJOrderPriceCell.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/6.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJOrderPriceCell.h"

@implementation XJOrderPriceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.name.textColor = KTEXTCOLOR;
    self.name.font = [UIFont systemFontOfSize:14];
    self.price.textColor = KREDCOKOR;
    self.price.font = [UIFont fontWithName:DINAFONT size:16];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
