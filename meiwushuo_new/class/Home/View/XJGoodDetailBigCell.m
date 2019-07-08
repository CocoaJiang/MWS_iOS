//
//  XJGoodDetailBigCell.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/2.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJGoodDetailBigCell.h"

@implementation XJGoodDetailBigCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setSystem];
}
-(void)setSystem{
    self.title.font = [UIFont systemFontOfSize:14];
    self.title.textColor = KTEXTCOLOR;
    self.number.textColor =self.marketPrice.textColor=KTEXTGRAYCOLOR;
    self.number.font = [UIFont systemFontOfSize:9];
    self.price.textColor = RGBA(233, 9, 9, 1);
    self.price.font = [UIFont fontWithName:DINAFONT size:16];
    self.marketPrice.font = [UIFont systemFontOfSize:12];
    self.gobuybutton.titleLabel.font = [UIFont systemFontOfSize:10];
    [self.gobuybutton setBackgroundColor:self.price.textColor];
    [self.gobuybutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}


@end
