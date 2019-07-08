//
//  XJSpellChildViewController.h
//  meiwushuo_new
//
//  Created by pro on 2019/7/3.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJBaseViewController.h"
#import "JXCategoryListContainerView.h"
#import "ZJScrollPageViewDelegate.h"
#import "JXPagerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface XJSpellChildViewController : XJBaseViewController <JXPagerViewListViewDelegate>
@property(copy,nonatomic)void(^PushController)(NSString *goodsIDString);

@end

NS_ASSUME_NONNULL_END
