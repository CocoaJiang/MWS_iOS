//
//  XJAddSpellGroupForAddFooter.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/8.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJAddSpellGroupForAddFooter.h"

@implementation XJAddSpellGroupForAddFooter

- (void)awakeFromNib {
    [super awakeFromNib];
    self.button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [self.button setBackgroundColor:KREDCOKOR];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(30);
        make.right.mas_equalTo(self.mas_right).offset(-30);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.mas_bottom);
        }
        make.height.mas_equalTo(@40);
    }];
}

@end
