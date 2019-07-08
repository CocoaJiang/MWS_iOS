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
static CGFloat const CYLTabBarControllerHeight = 40.f;
#define RANDOM_COLOR [UIColor colorWithHue: (arc4random() % 256 / 256.0) saturation:((arc4random()% 128 / 256.0 ) + 0.5) brightness:(( arc4random() % 128 / 256.0 ) + 0.5) alpha:1]

@interface XJTabBarController ()<UITabBarControllerDelegate>
@property (nonatomic, weak) UIButton *selectedCover;
@end

@implementation XJTabBarController

- (instancetype)initWithContext:(NSString *)context {
    UIEdgeInsets imageInsets = UIEdgeInsetsZero;//UIEdgeInsetsMake(4.5, 0, -4.5, 0);
    UIOffset titlePositionAdjustment = UIOffsetMake(0, -3.5);
    if (self = [super initWithViewControllers:[self viewControllersForTabBar]
                        tabBarItemsAttributes:[self tabBarItemsAttributesForTabBar]
                                  imageInsets:imageInsets
                      titlePositionAdjustment:titlePositionAdjustment
                                      context:context
                ]) {
        [self customizeTabBarAppearance];
        self.delegate = self;
        self.navigationController.navigationBar.hidden = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    [self becomeFirstResponder];
   // [self customizeInterface];
}

- (NSArray *)viewControllersForTabBar {
    XJHomeController *firstViewController = [[XJHomeController alloc] init];
    XJNavigationController *firstNavigationController = [[XJNavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    [firstViewController cyl_setHideNavigationBarSeparator:YES];
    
    XJTheSameCityController *secondViewController = [[XJTheSameCityController alloc] init];
    XJNavigationController *secondNavigationController = [[XJNavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    [secondViewController cyl_setHideNavigationBarSeparator:YES];

    
    XJVideosController *thirdViewController = [[XJVideosController alloc] init];
    XJNavigationController *thirdNavigationController = [[XJNavigationController alloc]
                                                   initWithRootViewController:thirdViewController];
    [thirdViewController cyl_setHideNavigationBarSeparator:YES];
    
    XJPersentCenterController *fourthViewController = [[XJPersentCenterController alloc] init];
    XJNavigationController *fourthNavigationController = [[XJNavigationController alloc]
                                                    initWithRootViewController:fourthViewController];
    [fourthNavigationController cyl_setHideNavigationBarSeparator:YES];
    
    NSArray *viewControllers = @[
                                 firstNavigationController,
                                 secondNavigationController,
                                 thirdNavigationController,
                                 fourthNavigationController
                                 ];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributesForTabBar {
    CGFloat firstXOffset = -12/2;
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"美物",
                                                 CYLTabBarItemImage : [UIImage imageNamed:@"meiwu_nor"],
                                                 CYLTabBarItemSelectedImage : @"meiwu",
                                                 CYLTabBarItemTitlePositionAdjustment: [NSValue valueWithUIOffset:UIOffsetMake(firstXOffset, -3.5)],
                                                 };
    CGFloat secondXOffset = (-25+2)/2;

    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"同城",
                                                  CYLTabBarItemImage : [UIImage imageNamed:@"tongcheng_nor"],
                                                  CYLTabBarItemSelectedImage : @"tongcheng_main",
                                                  CYLTabBarItemTitlePositionAdjustment: [NSValue valueWithUIOffset:UIOffsetMake(secondXOffset, -3.5)],
                                                  };
    
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"视频",
                                                 CYLTabBarItemImage : [UIImage imageNamed:@"shipin_nor"],
                                                 CYLTabBarItemSelectedImage : @"shipin",
                                                 CYLTabBarItemTitlePositionAdjustment: [NSValue valueWithUIOffset:UIOffsetMake(-secondXOffset, -3.5)],
                                              
                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"我的",
                                                  CYLTabBarItemImage :[UIImage imageNamed:@"wode_nor"],
                                                  CYLTabBarItemSelectedImage : @"wode",
                                                  CYLTabBarItemTitlePositionAdjustment: [NSValue valueWithUIOffset:UIOffsetMake(-firstXOffset, -3.5)],
                                                 };
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes,
                                       fourthTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}

- (void)customizeTabBarAppearance {
    [self rootWindow].backgroundColor = [UIColor cyl_systemBackgroundColor];
    
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor cyl_systemGrayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = KREDCOKOR;
    
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
}

- (void)updateTabBarCustomizationWhenTabBarItemWidthDidUpdate {
    void (^deviceOrientationDidChangeBlock)(NSNotification *) = ^(NSNotification *notification) {
        UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
        if ((orientation == UIDeviceOrientationLandscapeLeft) || (orientation == UIDeviceOrientationLandscapeRight)) {
        } else if (orientation == UIDeviceOrientationPortrait) {
        }
        [self customizeTabBarSelectionIndicatorImage];
    };
    [[NSNotificationCenter defaultCenter] addObserverForName:CYLTabBarItemWidthDidChangeNotification
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:deviceOrientationDidChangeBlock];
}

- (void)customizeTabBarSelectionIndicatorImage {
    CGFloat tabBarHeight = CYLTabBarControllerHeight;
    CGSize selectionIndicatorImageSize = CGSizeMake(CYLTabBarItemWidth, tabBarHeight);
    UITabBar *tabBar = self.tabBar ?: [UITabBar appearance];
    [tabBar setSelectionIndicatorImage:
     [[self class] imageWithColor:[UIColor whiteColor]
                             size:selectionIndicatorImageSize]];
}

+ (UIImage *)scaleImage:(UIImage *)image {
    CGFloat halfWidth = image.size.width/2;
    CGFloat halfHeight = image.size.height/2;
    UIImage *secondStrechImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(halfHeight, halfWidth, halfHeight, halfWidth) resizingMode:UIImageResizingModeStretch];
    return secondStrechImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width + 1, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"🔴类名与方法名：%@（在第%@行），描述：%@", @(__PRETTY_FUNCTION__), @(__LINE__), @"");
}


- (UIButton *)selectedCover {
    if (_selectedCover) {
        return _selectedCover;
    }
    UIButton *selectedCover = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:@"jia"];
    [selectedCover setImage:image forState:UIControlStateNormal];
    selectedCover.frame = ({
        CGRect frame = selectedCover.frame;
        frame.size = CGSizeMake(image.size.width, image.size.height);
        frame;
    });
    selectedCover.translatesAutoresizingMaskIntoConstraints = NO;
    // selectedCover.userInteractionEnabled = false;
    _selectedCover = selectedCover;
    return _selectedCover;
}
- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection  {
    [super traitCollectionDidChange:previousTraitCollection];
    if (@available(iOS 13.0, *)) {
#if __has_include(<UIKit/UIScene.h>)
        UIUserInterfaceStyle currentUserInterfaceStyle = [UITraitCollection currentTraitCollection].userInterfaceStyle;
        if (currentUserInterfaceStyle == previousTraitCollection.userInterfaceStyle) {
            return;
        }
#else
#endif
        //TODO:
        [[UIViewController cyl_topmostViewController].navigationController.navigationBar setBarTintColor:[UIColor cyl_systemBackgroundColor]];
    }
    
}

- (void)customizeInterface {
    //设置导航栏
    //    [self setUpNavigationBarAppearance];
    [self hideTabBarShadowImageView];
    //    if (@available(iOS 13.0, *)) {
    //        tabBarController.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    //    }
    //添加小红点
    //添加提示动画，引导用户点击
    [self setViewDidLayoutSubViewsBlockInvokeOnce:YES block:^(CYLTabBarController *tabBarController) {
        NSUInteger delaySeconds = 1.5;
        dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaySeconds * NSEC_PER_SEC));
        dispatch_after(when, dispatch_get_main_queue(), ^{
            @try {
                UIViewController *viewController0 = tabBarController.viewControllers[0];
                [viewController0 cyl_setBadgeBackgroundColor:RANDOM_COLOR];
                [viewController0 cyl_setBadgeCenterOffset:CGPointMake(-5, 3)];
                [viewController0 cyl_showBadge];
                
                [tabBarController.viewControllers[1] cyl_setBadgeBackgroundColor:RANDOM_COLOR];
                [tabBarController.viewControllers[1] cyl_showBadgeValue:@"" animationType:CYLBadgeAnimationTypeScale];
                [tabBarController.viewControllers[2] cyl_showBadgeValue:@"" animationType:CYLBadgeAnimationTypeShake];
                
                NSString *testBadgeString = @"100";
                //                [tabBarController.viewControllers[3] cyl_setBadgeMargin:-5];
                //                CGSize size = [testBadgeString sizeWithAttributes:
                //                               @{NSFontAttributeName:
                //                                     tabBarController.viewControllers[3].cyl_badgeFont}];
                //                float labelHeight = ceilf(size.height);
                //                [tabBarController.viewControllers[3] cyl_setBadgeCornerRadius:(labelHeight+ tabBarController.viewControllers[3].cyl_badgeMargin)/2];
                [tabBarController.viewControllers[3] cyl_showBadgeValue:testBadgeString animationType:CYLBadgeAnimationTypeBounce];
                
                [tabBarController.viewControllers[4] cyl_showBadgeValue:@"NEW" animationType:CYLBadgeAnimationTypeBreathe];
            } @catch (NSException *exception) {}
            
            //添加仿淘宝tabbar，第一个tab选中后有图标覆盖
            if (self.selectedIndex != 0) {
                return;
            }
            // tabBarController.selectedIndex = 1;
        });
    }];
}


#pragma mark - delegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control {
    UIView *animationView;
    if ([control cyl_isTabButton]) {
        //更改红标状态
        if ([self.selectedViewController cyl_isShowBadge]) {
            [self.selectedViewController cyl_clearBadge];
        } else {
            [self.selectedViewController cyl_clearBadge];
        }
        animationView = [control cyl_tabImageView];
    }

    UIButton *button = CYLExternPlusButton;
    BOOL isPlusButton = [control cyl_isPlusButton];
    // 即使 PlusButton 也添加了点击事件，点击 PlusButton 后也会触发该代理方法。
    if (isPlusButton) {
        animationView = button.imageView;
    }

    [self addScaleAnimationOnView:animationView repeatCount:1];
    // [self addRotateAnimationOnView:animationView];//暂时不推荐用旋转方式，badge也会旋转。

    //添加仿淘宝tabbar，第一个tab选中后有图标覆盖
    if ([control cyl_isTabButton]|| [control cyl_isPlusButton]) {
        //        BOOL shouldSelectedCoverShow = (self.selectedIndex == 0);
        //        [self setSelectedCoverShow:shouldSelectedCoverShow];
    }
}

//缩放动画
- (void)addScaleAnimationOnView:(UIView *)animationView repeatCount:(float)repeatCount {
    UIImageView *imageView = (UIImageView *)animationView;
    if (imageView.image == [UIImage imageNamed:@"jia"]) {
        return;
    }else{
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
        animation.keyPath = @"transform.scale";
        animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
        animation.duration = 1;
        animation.repeatCount = repeatCount;
        animation.calculationMode = kCAAnimationCubic;
        [animationView.layer addAnimation:animation forKey:nil];
    }
    
}

//旋转动画
- (void)addRotateAnimationOnView:(UIView *)animationView {
    // 针对旋转动画，需要将旋转轴向屏幕外侧平移，最大图片宽度的一半
    // 否则背景与按钮图片处于同一层次，当按钮图片旋转时，转轴就在背景图上，动画时会有一部分在背景图之下。
    // 动画结束后复位
    animationView.layer.zPosition = 65.f / 2;
    [UIView animateWithDuration:0.32 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        animationView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
    } completion:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.70 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
            animationView.layer.transform = CATransform3DMakeRotation(2 * M_PI, 0, 1, 0);
        } completion:nil];
    });
}



@end
