//
//  XJSpecificationCell.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/8.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJSpecificationCell.h"

@implementation XJSpecificationCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.name.textColor = KTEXTGRAYCOLOR;
    self.content.textColor = KTEXTCOLOR;
    self.name.font  =self.content.font = [UIFont systemFontOfSize:14];
    self.content.preferredMaxLayoutWidth = SCREEN_WIDTH - self.name.right-40;
    self.name.text = @"颜色分类";
    self.content.text = @"红色白色黄色黑色紫色红色白色黄色黑色紫色红色白色黄色黑色紫色红色白色";
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
