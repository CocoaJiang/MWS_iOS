//
//  UIApplication+GetNav.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/4.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "UIApplication+GetNav.h"

@implementation UIApplication (GetNav)

- (UIWindow *)mainWindow {
    return self.delegate.window;
}
- (UIViewController *)visibleViewController {
    UIViewController *rootViewController = [self.mainWindow rootViewController];
    return [self getVisibleViewControllerFrom:rootViewController];
}
- (UIViewController *) getVisibleViewControllerFrom:(UIViewController *) vc {
    if ([vc isKindOfClass:[XJNavigationController class]]) {
        return [self getVisibleViewControllerFrom:[((XJNavigationController *) vc) visibleViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self getVisibleViewControllerFrom:[((UITabBarController *) vc) selectedViewController]];
    } else {
        if (vc.presentedViewController) {
            return [self getVisibleViewControllerFrom:vc.presentedViewController];
        } else {
            return vc;
        }
    }
}
- (XJNavigationController *)visibleNavigationController {
    return [[self visibleViewController] navigationController];
}

@end
