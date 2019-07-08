//
//  XJSpellGropuHeaderGoods.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/4.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJSpellGropuHeaderGoods.h"

@implementation XJSpellGropuHeaderGoods

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
    self.title.font = [UIFont systemFontOfSize:14];
    self.title.textColor = KTEXTCOLOR;
    self.price.textColor = RGBA(233, 9, 9, 1);
    self.price.font = [UIFont fontWithName:DINAFONT size:18];
    self.price.text = [Tools retrunPriceWithPriceString:@"2998"];
    self.marketPrice.attributedText = [Tools returnPriceMedicLineWithString:@"300"];
    self.induceLabel.textColor = KTEXTGRAYCOLOR;
    self.induceLabel.font = [UIFont systemFontOfSize:12];
}

-(void)setactiveIngWithString:(NSString *)string{
    self.induceLabel.textColor = KREDCOKOR;
    self.induceLabel.font = [UIFont systemFontOfSize:13];
    self.induceLabel.text = string;
}

@end
