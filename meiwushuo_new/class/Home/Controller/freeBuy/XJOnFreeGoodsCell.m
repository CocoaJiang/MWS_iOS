//
//  XJOnFreeGoodsCell.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/2.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJOnFreeGoodsCell.h"

@implementation XJOnFreeGoodsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setsystem];
}

-(void)setsystem{
    self.title.font = [UIFont systemFontOfSize:14];
    self.title.textColor = KTEXTCOLOR;
    self.price.textColor = RGBA(233, 9, 9, 1);
    self.price.font  = [UIFont fontWithName:DINAFONT size:16];

    self.inventory.attributedText = [Tools ReturnFontWithString:@"库存:" andWithColor:KTEXTGRAYCOLOR andWithFont:[UIFont systemFontOfSize:11] andWithString:@"30000" andWithColor:KTEXTGRAYCOLOR andWithFont:[UIFont fontWithName:DINAFONT size:13]];
    self.inventory2.attributedText = self.inventory.attributedText;
    self.inventory2.hidden = YES;
    self.marketPrice.textColor = KTEXTGRAYCOLOR;
    self.marketPrice.font = [UIFont systemFontOfSize:12];
    [self.progress setTrackTintColor:[UIColor groupTableViewBackgroundColor]];
    self.progress.progressTintColor = RGBA(233, 9, 9, 1);
    [self.button setBackgroundColor:RGBA(233, 9, 9, 1)];
    [self.button setTitle:@"去抢购" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.button.titleLabel.font = [UIFont systemFontOfSize:12];
    self.marketPrice.attributedText = [Tools returnPriceMedicLineWithString:@"300"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}
-(void)setType:(CellType)type{
    _type = type;
    if (type==SpellGroup) {
        self.progress.hidden = YES;
        self.inventory.hidden = YES;
        [self.button setTitle:@"去拼团" forState:UIControlStateNormal];
        self.price.text = [NSString stringWithFormat:@"拼团价格¥:500"];
    }
    if (type==MakeORderDetail) {
        self.progress.hidden = YES;
        self.button.hidden = YES;
        self.inventory.hidden = YES;
        self.inventory2.hidden = NO;
        
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
}



@end
