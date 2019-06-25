//
//  XJNavigationController.m
//  meiwushuo_new
//
//  Created by pro on 2019/6/25.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJNavigationController.h"

@interface XJNavigationController ()

@end

@implementation XJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UINavigationBar appearance].shadowImage = [UIImage new];
    [[UINavigationBar appearance] setBarTintColor:APPMAINCOLOR];
    [UINavigationBar appearance].translucent = NO;
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (@available(iOS 11.0, *)) {
        UIImage *backButtonImage = [[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.navigationBar.backIndicatorImage = backButtonImage;
        self.navigationBar.backIndicatorTransitionMaskImage = backButtonImage;
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-SCREEN_WIDTH, 0)forBarMetrics:UIBarMetricsDefault];//UIOffsetMake(-kScreenWidth, 0)zh只要横向偏移，纵向偏移返回图标也会偏移
    }
    else{
        UIImage *backButtonImage = [[UIImage imageNamed:@"back"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-SCREEN_WIDTH, -SCREENH_HEIGHT)forBarMetrics:UIBarMetricsDefault];
    }
    if (self.childViewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


@end
