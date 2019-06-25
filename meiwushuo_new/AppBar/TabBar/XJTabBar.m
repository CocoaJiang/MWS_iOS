//
//  XJTabBar.m
//  meiwushuo_new
//
//  Created by pro on 2019/6/25.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJTabBar.h"

@implementation XJTabBar


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"suishipai"] forState:UIControlStateNormal];
        btn.bounds = CGRectMake(0, 0, 64, 70);
        [btn setTitle:@"美拍" forState:UIControlStateNormal];
        [btn setUpImageAndDownLableWithSpace:5];
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
        
        self.centerBtn = btn;
        [self addSubview:btn];
        
    }
    return self;
}

- (void)layoutSubviews
{
    
    [super layoutSubviews];
    
    self.centerBtn.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.3);
    
    int index = 0;
    CGFloat wigth = self.bounds.size.width / 5;
    
    for (UIView* sub in self.subviews) {
        
        if ([sub isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            sub.frame = CGRectMake(index * wigth, self.bounds.origin.y, wigth, self.bounds.size.height - 2);
            
            index++;
            
            if (index == 2) {
                index++;
            }
        }
    }
}



- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    if (self.isHidden == NO) {
        
        CGPoint newPoint = [self convertPoint:point toView:self.centerBtn];
        
        if ( [self.centerBtn pointInside:newPoint withEvent:event]) {
            return self.centerBtn;
        }else{
            
            return [super hitTest:point withEvent:event];
        }
    }
    
    else {
        return [super hitTest:point withEvent:event];
    }
}



@end
