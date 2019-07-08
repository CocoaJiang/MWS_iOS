//
//  MiddleAnimation.m
//  SLCustomTabBar
//
//  Created by 苏磊 on 2017/6/14.
//  Copyright © 2017年 苏磊. All rights reserved.
//

#import "MiddleAnimation.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
#define CenterPoint CGPointMake(W/2 ,H-38.347785)
#define bl [[UIScreen mainScreen]bounds].size.width/375
#define Color(r, g, b , a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface MiddleAnimation()
//center button
@property (strong , nonatomic) UIButton* centerBtn;
//other function button
@property (strong , nonatomic) NSMutableArray* btnItem;
@property (strong , nonatomic) NSMutableArray* btnItemTitle;
/** rect */
@property (nonatomic,assign) CGRect rect;
@end

@implementation MiddleAnimation

/**
 *  show view
 */
+(MiddleAnimation *)standardMiddleAnimationWithView:(UIView *)view {
    
    MiddleAnimation * animateView = [[MiddleAnimation alloc] init];
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:animateView];
    CGRect rect = [animateView convertRect:view.frame fromView:view.superview];
    rect.origin.y += 5;
    animateView.rect = rect;
    
    [animateView CrentBtnImageName:@"发起录制视频" Title:@"视频" tag:0];
    [animateView CrentBtnImageName:@"个人中心—开始直播" Title:@"直播" tag:1];
   // [animateView CrentBtnImageName:@"post_animate_akey" Title:@"一键转卖" tag:2];
    //Add center button
    [animateView CrentCenterBtnImageName:@"jia" tag:3];
    //Do animation
    [animateView AnimateBegin];
    return animateView;
}

- (instancetype)init{
    self = [super init];
    if (self)
    {
        self.frame = [[UIScreen mainScreen]bounds];
        self.backgroundColor =[[UIColor blackColor]colorWithAlphaComponent:0.2];
        
        UIBlurEffect *blurEffect=[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView *visualEffectView=[[UIVisualEffectView alloc]initWithEffect:blurEffect];
        [visualEffectView setFrame:self.bounds];
        [self addSubview:visualEffectView];
        
    }
    return self;
}

/**
 *  creat button
 */
- (void)CrentBtnImageName:(NSString *)ImageName Title:(NSString *)Title tag:(int)tag{
    if (_btnItem.count >= 3)  return;
    UIButton * btn = [[UIButton alloc]initWithFrame:self.rect];
    btn.tag = tag;
    [btn setImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn];
    [self.btnItem addObject:btn];
    [self.btnItemTitle addObject:[self CrenterBtnTitle:Title]];
}

/**
 *  creat center button
 */
- (void)CrentCenterBtnImageName:(NSString *)ImageName tag:(int)tag{
    _centerBtn = [[UIButton alloc]initWithFrame:self.rect];
    [_centerBtn setImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
    [_centerBtn addTarget:self action:@selector(cancelAnimation) forControlEvents:UIControlEventTouchUpInside];
    _centerBtn.tag = tag;
    [self addSubview:_centerBtn];
}

/**
 *  getter
 */
- (NSMutableArray *)btnItem{
    if (!_btnItem) {
        _btnItem = [NSMutableArray array];
    }
    return _btnItem;
}
- (NSMutableArray *)btnItemTitle{
    if (!_btnItemTitle) {
        _btnItemTitle = [NSMutableArray array];
    }
    return _btnItemTitle;
}
- (UILabel *)CrenterBtnTitle:(NSString *)Title{
    UILabel * lab = [[UILabel alloc]init];
    lab.textColor = Color(240, 240, 240,1);
    lab.font = [UIFont italicSystemFontOfSize:13.5*bl];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = Title;
    [self addSubview:lab];
    return lab;
}

/**
 *  remove view and notice the selectIndex
 */
- (void)removeView:(UIButton*)btn{
    [self removeFromSuperview];
    [self.delegate didSelectBtnWithBtnTag:btn.tag];
}

/**
 *  click other space to cancle
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self cancelAnimation];
}

/**
 *  button click
 */
- (void)BtnClick:(UIButton*)btn{
    NSLog(@"%ld click",(long)btn.tag);
    [self.delegate didSelectBtnWithBtnTag:btn.tag];
    [self removeFromSuperview];
}


/**
 *  Do animation
 */
- (void)AnimateBegin{
    ////这是底部的button的动画处理
    [UIView animateWithDuration:0.2 animations:^{
        self->_centerBtn.transform = CGAffineTransformMakeRotation(-M_PI_4-M_LOG10E);
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15 animations:^{
            self->_centerBtn.transform = CGAffineTransformMakeRotation(-M_PI_4+M_LOG10E);
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:0.15 animations:^{
                self->_centerBtn.transform = CGAffineTransformMakeRotation(-M_PI_4);
            }];
        }];
    }];
    
    
    __block int  i = 0 , k = 0;
    
    ///这里是移动动画
    
    for (UIView *  btn in _btnItem) {
        //rotation
        [UIView animateWithDuration:0.7 delay:i*0.14 usingSpringWithDamping:0.46 initialSpringVelocity:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            btn.transform = CGAffineTransformScale(btn.transform, 1.2734*bl, 1.2734*bl);//缩放
            btn.center = CGPointMake(SCREEN_WIDTH/4+i*(SCREEN_WIDTH/2),self.frame.size.height-165*bl);
            i++;
           // btn.center = CGPointMake((74+i++*113)*bl, self.frame.size.height-165*bl);
            
        } completion:nil];
        
        //move
        
        ////抖动的动画
        
        [UIView animateWithDuration:0.2 delay:i*0.1 options:UIViewAnimationOptionTransitionNone animations:^{
            btn.transform = CGAffineTransformRotate (btn.transform, -M_2_PI);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
                btn.transform = CGAffineTransformRotate (btn.transform, M_2_PI+M_LOG10E);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
                    btn.transform = CGAffineTransformRotate (btn.transform, -M_LOG10E);
                } completion:^(BOOL finished) {
                    UILabel * lab = (UILabel *)self->_btnItemTitle[k++];
                    lab.frame = CGRectMake(0, 0, W/3-30, 30);
                    lab.center = CGPointMake(btn.center.x, CGRectGetMaxY(btn.frame)+20);
                }];
            }];
        }];
    }
    
    
}




/////这是回来的动画
- (void)cancelAnimation{
    //rotation
    [UIView animateWithDuration:0.15 animations:^{
        self->_centerBtn.transform = CGAffineTransformIdentity;
    }completion:^(BOOL finished) {
        //move
        int n = (int)self->_btnItem.count;
        for (int i = n-1; i>=0; i--){
            UIButton *btn = self->_btnItem[i];
            [UIButton animateWithDuration:0.25 delay:0.1*(n-i) options:UIViewAnimationOptionTransitionCurlDown animations:^{
                btn.center = CGPointMake(W/2 ,H-43.052385);
                btn.transform = CGAffineTransformMakeScale(1, 1);
                btn.transform = CGAffineTransformRotate(btn.transform, -M_PI_4);
                
                UILabel * lab = (UILabel *)self->_btnItemTitle[i];
                [lab removeFromSuperview];
            } completion:^(BOOL finished) {
                [btn removeFromSuperview];
                if (i==0) {
                    [self removeFromSuperview];
                }
            }];
        }
    }];
    
}


@end
