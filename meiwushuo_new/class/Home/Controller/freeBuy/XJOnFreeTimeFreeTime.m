//
//  XJOnFreeTimeFreeTime.m
//  iphoneLive
//
//  Created by pro on 1019/6/19.
//  Copyright © 1019 美物说. All rights reserved.
//

#import "XJOnFreeTimeFreeTime.h"

@interface XJOnFreeTimeFreeTime ()
@property(strong,nonatomic)UILabel *minutesLabel;
@property(strong,nonatomic)UILabel *secondsLabel;
@property(strong,nonatomic)UILabel *msLabel;
@property(strong,nonatomic)UILabel *label1;
@property(strong,nonatomic)UILabel *label2;
@end
@implementation XJOnFreeTimeFreeTime
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.minutesLabel.text =  self.secondsLabel.text = self.msLabel.text = @"00";
        self.minutesLabel.textAlignment = self.secondsLabel.textAlignment = self.msLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.minutesLabel];
        [self addSubview:self.label1];
        [self addSubview:self.secondsLabel];
        [self addSubview:self.msLabel];
        [self addSubview:self.label2];
    }
    return self;
}

-(void)layoutSubviews{
    self.minutesLabel.frame = CGRectMake(10, 5, 30, 30);
    self.label1.frame  = CGRectMake(self.minutesLabel.right, 5, 10, 30);
    self.secondsLabel.frame = CGRectMake(self.label1.right, 5, 30, 30);
    self.label2.frame  = CGRectMake(self.secondsLabel.right, 5, 10, 30);
    self.msLabel.frame = CGRectMake(self.label2.right, 5, 30, 30);
}
-(void)setHours:(NSString *)hours{
    _hours = hours;
    _minutesLabel.text = hours;
}
-(void)setSends:(NSString *)sends{
    _sends =sends;
    _secondsLabel.text  = sends;
}
-(void)setThireds:(NSString *)thireds{
    _thireds = thireds;
    _msLabel.text = thireds;
}

-(UILabel *)minutesLabel{
    if (!_minutesLabel) {
        _minutesLabel = [[UILabel alloc]init];
        _minutesLabel.font = [UIFont systemFontOfSize:14];
        _minutesLabel.textColor = APPMAINCOLOR;
        _minutesLabel.layer.borderWidth = 0.5f;
        _minutesLabel.layer.borderColor = APPMAINCOLOR.CGColor;
    }
    return _minutesLabel;
}
-(UILabel *)secondsLabel{
    if (!_secondsLabel) {
        _secondsLabel = [[UILabel alloc]init];
        _secondsLabel.font = [UIFont systemFontOfSize:14];
        _secondsLabel.textColor = APPMAINCOLOR;
        _secondsLabel.layer.borderWidth = 0.5f;
        _secondsLabel.layer.borderColor = APPMAINCOLOR.CGColor;
    }
    return _secondsLabel;
}
-(UILabel *)msLabel{
    if (!_msLabel) {
        _msLabel = [[UILabel alloc]init];
        _msLabel.font = [UIFont systemFontOfSize:14];
        _msLabel.textColor = APPMAINCOLOR;
        _msLabel.layer.borderWidth = 0.5f;
        _msLabel.layer.borderColor = APPMAINCOLOR.CGColor;
    }
    return _msLabel;
}

-(UILabel *)label1{
    if (!_label1) {
        _label1 = [[UILabel alloc]init];
        _label1.font = [UIFont systemFontOfSize:14];
        _label1.textColor = APPMAINCOLOR;
        _label1.text = @"：";
    }
    return _label1;
}

-(UILabel *)label2{
    if (!_label2) {
        _label2 = [[UILabel alloc]init];
        _label2.font = [UIFont systemFontOfSize:14];
        _label2.textColor = APPMAINCOLOR;
        _label2.text = @"：";
    }
    return _label2;
}




@end
