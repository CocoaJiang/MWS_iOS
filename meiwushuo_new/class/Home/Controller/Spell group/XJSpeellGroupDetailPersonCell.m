//
//  XJSpeellGroupDetailPersonCell.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/8.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJSpeellGroupDetailPersonCell.h"

@implementation XJSpeellGroupDetailPersonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.goSpellGroup.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.goSpellGroup setBackgroundColor:KREDCOKOR];
    self.name.textColor = KTEXTCOLOR;
    self.name.font = [UIFont systemFontOfSize:14];
    self.induce.textColor = self.time.textColor = KTEXTCOLOR;
    self.induce.font = self.time.font = [UIFont systemFontOfSize:12];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
