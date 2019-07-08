//
//  HcdGuideViewManager.h
//  HcdGuideViewDemo
//
//  Created by polesapp-hcd on 16/7/12.
//  Copyright © 2016年 Polesapp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HcdGuideView : NSObject

@property (nonatomic, strong) UIWindow *window;

/**
 *  创建单例模式
 *
 *  @return 单例
 */
+ (instancetype)sharedInstance;

/**
 *  引导页图片
 *
 *  @param images      引导页图片
 */
- (void)showGuideViewWithImages:(NSArray *)images;

@end
