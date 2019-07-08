//
//  XJPayView.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/6.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJPayView.h"

@implementation XJPayView

-(void)awakeFromNib{
    [super awakeFromNib];
    [self.payButton setTitle:@"提交订单" forState:UIControlStateNormal];
    self.payButton.titleLabel.font = [UIFont systemFontOfSize:15];
    self.priceLabel.attributedText = [Tools ReturnFontWithString:@"需付款:¥" andWithColor:KTEXTGRAYCOLOR andWithFont:[UIFont systemFontOfSize:13] andWithString:@"300.00" andWithColor:KREDCOKOR andWithFont:[UIFont fontWithName:DINAFONT size:16]];
    [self.payButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.payButton setBackgroundColor:KREDCOKOR];
}


@end
