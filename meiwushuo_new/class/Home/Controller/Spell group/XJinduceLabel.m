//
//  XJinduceLabel.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/4.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJinduceLabel.h"

@implementation XJinduceLabel

-(void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    self.labe1.font = self.labe2.font = self.label3.font = [UIFont systemFontOfSize:12];
    self.label3.textColor =
    self.labe2.textColor =
    self.labe1.textColor = KTEXTCOLOR;
}

@end
