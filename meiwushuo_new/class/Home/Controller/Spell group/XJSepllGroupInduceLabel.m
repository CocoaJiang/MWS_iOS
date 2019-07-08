//
//  XJSepllGroupInduceLabel.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/8.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJSepllGroupInduceLabel.h"

@implementation XJSepllGroupInduceLabel

- (void)awakeFromNib {
    [super awakeFromNib];
    self.induce.textColor = KTEXTCOLOR;
    self.induce.font = [UIFont systemFontOfSize:14];
    self.lookMore.textColor  = KTEXTGRAYCOLOR;
    self.lookMore.font = [UIFont systemFontOfSize:12];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
