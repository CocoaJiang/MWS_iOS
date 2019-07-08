//
//  XJHomeBgView.m
//  meiwushuo_new
//
//  Created by pro on 2019/6/29.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJHomeBgView.h"

@interface XJHomeBgView ()
@property(strong,nonatomic)UIColor *color;
@property(strong,nonatomic)UIColor *color2;
@end


@implementation XJHomeBgView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self  = [super initWithFrame:frame]) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(colorISChange:) name:@"COLORISCHANGE" object:nil];
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    
    CGFloat x  = rect.origin.x;
    CGFloat y = rect.origin.y;
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    ///起始点
    CGPoint a = CGPointMake(x, y);
    CGPoint b = CGPointMake(w, y);
    CGPoint c = CGPointMake(w, h);
    CGPoint d = CGPointMake(w/2, h-50);
    CGPoint e = CGPointMake(x, h);
    
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    UIBezierPath  *path  = [UIBezierPath bezierPath];
    [path moveToPoint:a];
    [path addLineToPoint:b];
    [path addLineToPoint:c];
    [path addQuadCurveToPoint:e controlPoint:d];
    [path closePath];
    [path stroke];

    shapelayer.fillColor = [UIColor greenColor].CGColor;
    shapelayer.path = path.CGPath;
    self.layer.mask = shapelayer;
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.frame;
    
    gradient.colors = @[(id)self.color.CGColor,(id)self.color2.CGColor];
    gradient.startPoint = CGPointMake(0, 1);
    gradient.endPoint = CGPointMake(1, 0);
    [self.layer addSublayer:gradient];



}

-(void)colorISChange:(NSNotification *)noti{
    NSDictionary *dict = noti.userInfo;
    self.color = [dict objectForKey:@"MAINCOLOR"];
    self.color2 = [dict objectForKey:@"FIRSTCOLOR"];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setNeedsDisplay];
    });
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(UIColor *)color{
    if (!_color) {
        _color = [UIColor whiteColor];
    }
    return _color;
}
-(UIColor *)color2{
    if (!_color2) {
        _color2 = [UIColor grayColor];
    }
    return _color2;
}

@end
