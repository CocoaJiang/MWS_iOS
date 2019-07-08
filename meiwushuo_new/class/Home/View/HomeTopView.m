//
//  HomeTopView.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/1.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "HomeTopView.h"
#import "UIView+Extension.h"
@implementation HomeTopView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.bgView.layer.masksToBounds=YES;
    self.bgView.layer.cornerRadius  =15;
}

@end
