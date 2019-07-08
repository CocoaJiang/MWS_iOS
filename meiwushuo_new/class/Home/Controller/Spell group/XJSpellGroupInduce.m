//
//  XJSpellGroupInduce.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/3.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJSpellGroupInduce.h"

@implementation XJSpellGroupInduce

- (void)awakeFromNib {
    [super awakeFromNib];
    self.indecelabel.textColor = KTEXTGRAYCOLOR;
    self.indecelabel.font = [UIFont systemFontOfSize:13];
    self.indecelabel.numberOfLines = 0;
    self.indecelabel.text = @"拼团玩法\n\n开团并邀请好友参团，人数不足自动退款";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
