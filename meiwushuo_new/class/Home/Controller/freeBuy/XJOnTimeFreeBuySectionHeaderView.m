//
//  XJOnTimeFreeBuySectionHeaderView.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/2.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJOnTimeFreeBuySectionHeaderView.h"
#import "XJOnFreeTimeFreeTime.h"
@interface XJOnTimeFreeBuySectionHeaderView ()
@property(strong,nonatomic)XJOnFreeTimeFreeTime *timeView;
@end


@implementation XJOnTimeFreeBuySectionHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.textColor = KTEXTCOLOR;
        label.font = [UIFont systemFontOfSize:13];
        label.text = @"| 即将开始 先下单先得哦";
        [self addSubview:label];
        [label sizeToFit];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(15);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        [self addSubview:self.timeView];
        [self.timeView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.mas_right).offset(-20);
                make.centerY.mas_equalTo(self.mas_centerY);
                make.size.mas_equalTo(CGSizeMake(120, 40));
        }];
        
        UILabel *label2 = [[UILabel alloc] init];
        label2.numberOfLines = 0;
        label2.textColor = KTEXTCOLOR;
        label2.font = [UIFont systemFontOfSize:13];
        label2.text = @"离专场开始";
        [self addSubview:label2];
        [label2 sizeToFit];
        
        [self addSubview:label2];
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_centerY);
            make.right.mas_equalTo(self.timeView.mas_left);
        }];

    }
    return self;
}

-(XJOnFreeTimeFreeTime *)timeView{
    if (!_timeView) {
        _timeView = [[XJOnFreeTimeFreeTime alloc]init];
    }
    return _timeView;
}





@end
