//
//  XJInputPhoneAndPassWordView.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/5.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJInputPhoneAndPassWordView.h"

@implementation XJInputPhoneAndPassWordView
-(void)awakeFromNib{
    [super awakeFromNib];
    self.textfield.clearButtonMode=UITextFieldViewModeAlways;
    self.lineView.hidden  = YES;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    if (self.type==1) {
    }else{
        self.layer.masksToBounds = NO;//不进行切割
        self.layer.shadowColor = [UIColor colorWithRed:35/255.0 green:35/255.0 blue:35/255.0 alpha:0.41].CGColor;
        self.layer.shadowOffset = CGSizeMake(0,5);
        self.layer.shadowOpacity = 1;
        self.layer.shadowRadius = 11;
        self.layer.cornerRadius = 20;
    }
}
- (void)setType:(InputType)type{
    _type = type;
    self.layer.masksToBounds = type==0?NO:YES;
    self.lineView.hidden = type==0?YES:NO;
}


@end
