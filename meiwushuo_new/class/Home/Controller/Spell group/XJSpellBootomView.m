//
//  XJSpellBootomView.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/3.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJSpellBootomView.h"

@implementation XJSpellBootomView


-(void)awakeFromNib{
    [super awakeFromNib];
    self.backButton.titleLabel.font =
    self.buyNowButton.titleLabel.font=
    self.aloneBuyButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.aloneBuyButton setBackgroundColor:RGBA(254, 128, 129, 1)];
    [self.buyNowButton setBackgroundColor:rgba(233, 9, 9, 1)];
    self.aloneBuyButton.titleLabel.lineBreakMode = self.buyNowButton.titleLabel.lineBreakMode = 0;
    self.aloneBuyButton.titleLabel.textAlignment = self.buyNowButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.backButton.clickAction = ^(UIButton *button) {
        [[Tools retrunNAV] popToRootViewControllerAnimated:YES];
    };
    NSAttributedString *string = [Tools ReturnFontWithString:@"￥39.00\n" andWithColor:[UIColor whiteColor] andWithFont:[UIFont fontWithName:DINAFONT size:12] andWithString:@"独自购买" andWithColor:[UIColor whiteColor] andWithFont:[UIFont systemFontOfSize:12]];
    [self.aloneBuyButton setAttributedTitle:string forState:UIControlStateNormal];
    
   
    NSAttributedString *string2 = [Tools ReturnFontWithString:@"￥39.00\n" andWithColor:[UIColor whiteColor] andWithFont:[UIFont fontWithName:DINAFONT size:12] andWithString:@"立即购买" andWithColor:[UIColor whiteColor] andWithFont:[UIFont systemFontOfSize:12]];
    [self.buyNowButton setAttributedTitle:string2 forState:UIControlStateNormal];
    
    
 
    
}

@end
