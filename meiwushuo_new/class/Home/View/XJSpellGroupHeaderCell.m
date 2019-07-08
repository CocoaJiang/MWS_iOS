//
//  XJSpellGroupHeaderCell.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/4.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJSpellGroupHeaderCell.h"

@implementation XJSpellGroupHeaderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.label1.text = @"3人满拼团";
    self.labe2.text = @"1下单开团/参团-----";
    self.labe3.text = @"2邀请好友参团-----";
    [self setSystemWithLabel:self.label1];
    [self setSystemWithLabel:self.labe2];
    [self setSystemWithLabel:self.labe3];
}


//label
-(void)setSystemWithLabel:(UILabel *)label{
    NSMutableAttributedString * firstPart = [[NSMutableAttributedString alloc] initWithString:[label.text substringToIndex:1]];
    NSDictionary * firstAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:RGBA(235, 9, 9, 1),NSKernAttributeName:@(2)};
    [firstPart setAttributes:firstAttributes range:NSMakeRange(0,firstPart.length)];
    NSMutableAttributedString * secend = [[NSMutableAttributedString alloc] initWithString:[label.text substringFromIndex:1]];
    NSDictionary * sendAuuributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13 ],NSForegroundColorAttributeName:KTEXTGRAYCOLOR,};
    [secend setAttributes:sendAuuributes range:NSMakeRange(0,secend.length)];
    [firstPart appendAttributedString:secend];
    label.attributedText = (NSAttributedString *)firstPart;
}
@end
