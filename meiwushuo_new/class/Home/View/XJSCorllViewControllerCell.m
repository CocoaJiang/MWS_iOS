//
//  XJSCorllViewControllerCell.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/1.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJSCorllViewControllerCell.h"

@implementation XJSCorllViewControllerCell

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self.contentView addSubview:self.XJimageView];
        
        self.backgroundColor = [UIColor clearColor];
        
        UIView *backView = self.contentView;
        
        backView.backgroundColor = [UIColor clearColor];
        
        [self.XJimageView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.top.mas_equalTo(self.contentView).offset(10);
            
            make.bottom.right.mas_equalTo(self.contentView).offset(-10);
        }];
    }
    return self;
    
}




-(UIImageView *)XJimageView{
    if (!_XJimageView) {
        _XJimageView = [[UIImageView alloc]init];
        _XJimageView.layer.masksToBounds  = YES;
        _XJimageView.layer.cornerRadius = 10;
    }
    return _XJimageView;
}

@end
