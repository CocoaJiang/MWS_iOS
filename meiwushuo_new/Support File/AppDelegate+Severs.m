//
//  AppDelegate+Severs.m
//  meiwushuo_new
//
//  Created by pro on 2019/6/25.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "AppDelegate+Severs.h"
#import "XJTabBarController.h"
@implementation AppDelegate (Severs)
-(void)initAnything{
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [[UIImageView appearance]setContentMode:UIViewContentModeScaleToFill];
    [self.window makeKeyAndVisible];
    if (@available(iOS 11.0, *)){
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
    self.window.rootViewController = [[XJTabBarController alloc]init];
    [self.window makeKeyAndVisible];
    [self setKeyBord];

}
-(void)setKeyBord{
    IQKeyboardManager *keyboardManager = [IQKeyboardManager sharedManager]; // 获取类库的单例变量
    keyboardManager.enable = YES; // 控制整个功能是否启用
    keyboardManager.shouldResignOnTouchOutside = YES; // 控制点击背景是否收起键盘
    keyboardManager.enableAutoToolbar=NO;//不显示上面的东西
}


@end
