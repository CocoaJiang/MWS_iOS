//
//  XJTabBarController.m
//  meiwushuo_new
//
//  Created by pro on 2019/6/25.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJTabBarController.h"
#import "XJHomeController.h"
#import "XJVideosController.h"
#import "XJPersentCenterController.h"
#import "XJTheSameCityController.h"
#import "XJTabBar.h"
#import "XJNavigationController.h"
@interface XJTabBarController ()


@end

@implementation XJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewController];
    [self setCustomtabbar];
}
-(void)addChildViewController{
    XJHomeController *xjhomeController = [[XJHomeController alloc]init];
    [self setUpOneChildVcWithVc:xjhomeController Image:@"meiwu_nor" selectedImage:@"meiwu" title:@"美物"];
    XJTheSameCityController * tongcehng = [[XJTheSameCityController alloc]init];
    [self setUpOneChildVcWithVc:tongcehng Image:@"tongcheng_nor" selectedImage:@"tongcheng_main" title:@"同城圈"];
    XJVideosController * vc3 = [[XJVideosController alloc]init];
    [self setUpOneChildVcWithVc:vc3 Image:@"shipin_nor" selectedImage:@"shipin" title:@"视频"];
    XJPersentCenterController * userInfo = [[XJPersentCenterController alloc]init];
    [self setUpOneChildVcWithVc:userInfo Image:@"wode_nor" selectedImage:@"wode" title:@"我的"];
   // [[UITabBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]]];
 //   [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
}

- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{

    XJNavigationController *nav = [[XJNavigationController alloc]initWithRootViewController:Vc];
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    Vc.tabBarItem.selectedImage = mySelectedImage;
    Vc.tabBarItem.title = title;
    Vc.navigationItem.title = title;
    [Vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:APPMAINCOLOR} forState:UIControlStateSelected];
    [Vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [self addChildViewController:nav];
    
}
- (void)setCustomtabbar{
   // XJTabBar *tabbar = [[XJTabBar alloc]init];
  //  [self setValue:tabbar forKeyPath:@"tabBar"];
   // [tabbar.centerBtn addTarget:self action:@selector(centerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)centerBtnClick:(UIButton *)btn{
    NSLog(@"点击了中间");
}


- (UIImage *)imageWithColor:(UIColor *)color{
    // 一个像素
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // 开启上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
