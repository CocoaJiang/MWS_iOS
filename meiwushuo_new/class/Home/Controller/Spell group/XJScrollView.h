//
//  XJScrollView.h
//  meiwushuo_new
//
//  Created by pro on 2019/7/2.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XJScrollView : UIView


////本地数组
@property(strong,nonatomic)NSArray *imageArray;

- (void)scrollViewDidScroll:(CGFloat)contentOffsetY;
@end

NS_ASSUME_NONNULL_END
