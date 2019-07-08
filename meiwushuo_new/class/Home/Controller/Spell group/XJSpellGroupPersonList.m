//
//  XJSpellGroupPersonList.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/4.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJSpellGroupPersonList.h"

@implementation XJSpellGroupPersonList

- (void)awakeFromNib {
    [super awakeFromNib];
    self.name.textColor = self.time.textColor = KTEXTCOLOR;
    self.name.font= [UIFont systemFontOfSize:16];
    self.time.font = [UIFont systemFontOfSize:13];
    self.icon.layer.masksToBounds = YES;
    self.icon.layer.cornerRadius = 25;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
