//
//  XJlookmoreSpellGroupList.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/8.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJlookmoreSpellGroupListcell.h"

@implementation XJlookmoreSpellGroupListcell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.num.textColor = KTEXTGRAYCOLOR;
    self.name.font = self.time.font = [UIFont systemFontOfSize:14];
    self.num.font = [UIFont systemFontOfSize:12];
    self.button.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.button setBackgroundColor:KREDCOKOR];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
