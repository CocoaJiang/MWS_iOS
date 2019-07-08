//
//  XJHomeGoodsCell.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/2.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJHomeGoodsCell.h"

@implementation XJHomeGoodsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.title.preferredMaxLayoutWidth = (SCREEN_WIDTH/2)-11;
    self.title.textColor = RGBA(51, 51, 51, 1);
    self.title.font = [UIFont systemFontOfSize:14];

    self.price.font = [UIFont fontWithName:DINAFONT size:15];
    self.price.textColor =  RGBA(233, 2, 45, 1);
    self.monkey.font = [UIFont systemFontOfSize:9];
    self.monkey.textColor = RGBA(153, 153, 153, 1);
    
    [self.detailButton setBackgroundColor:RGBA(233, 2, 45, 1)];
    [self.detailButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.detailButton.titleLabel.font = [UIFont systemFontOfSize:11];
}

-(void)setType:(XJGoodscollectionViewType)type{
    _type = type;
    [self.detailButton setTitle:@"拼团" forState:UIControlStateNormal];
     self.backgroundColor = [UIColor groupTableViewBackgroundColor];
}


@end
