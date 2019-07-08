//
//  XJSpellTeamDetailCell.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/6.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJSpellTeamDetailCell.h"

@implementation XJSpellTeamDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setSystem];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

///系统设置。。。。。。。。
-(void)setSystem{
    self.orderNumber.textColor = KTEXTCOLOR;
    self.orderNumber.font = [UIFont systemFontOfSize:15];
    
    self.status.textColor = KREDCOKOR;
    self.status.font = [UIFont systemFontOfSize:12];
    
    self.title.attributedText = [Tools ReturnWithString:@"【三人团】" andWithColor:KREDCOKOR andWithFont:14 andWithString:@"百雀羚水嫩倍现盈透精华水补水 保湿爽肤水女收缩..." andWithColor:KTEXTCOLOR andWithFont:14];
    self.price.attributedText  = [Tools ReturnFontWithString:@"总额:" andWithColor:KREDCOKOR andWithFont:[UIFont boldSystemFontOfSize:14] andWithString:[Tools retrunPriceWithPriceString:@"3000"] andWithColor:KREDCOKOR andWithFont:[UIFont fontWithName:DINAFONT size:16]];
    NSMutableAttributedString *attarting = [[NSMutableAttributedString alloc]initWithString:@"共" attributes:@{
                                                                                                              NSFontAttributeName:[UIFont systemFontOfSize:13],
                                                                                                              NSForegroundColorAttributeName:KTEXTGRAYCOLOR
                                                                                                              }];
    [attarting appendAttributedString:[Tools ReturnWithString:@"1" andWithColor:KREDCOKOR andWithFont:13 andWithString:@"件商品" andWithColor:KTEXTGRAYCOLOR andWithFont:13]];
    self.total.attributedText = attarting;
    [self.button setBackgroundColor:KREDCOKOR];
    self.button.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.button setTitle:@"查看详情" forState:UIControlStateNormal];
    self.topView.constant=30;
    
    
}



@end
