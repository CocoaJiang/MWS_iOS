//
//  UIApplication+GetNav.h
//  meiwushuo_new
//
//  Created by pro on 2019/7/4.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XJNavigationController.h"
NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (GetNav)
-(XJNavigationController *)visibleNavigationController;
@end

NS_ASSUME_NONNULL_END
