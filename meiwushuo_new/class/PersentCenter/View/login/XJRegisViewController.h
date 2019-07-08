//
//  XJRegisViewController.h
//  meiwushuo_new
//
//  Created by pro on 2019/7/5.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJBaseViewController.h"

typedef NS_ENUM(NSInteger,regisType) {
    XJREGIS=0,
    XJFORGET=1,
};

NS_ASSUME_NONNULL_BEGIN

@interface XJRegisViewController : XJBaseViewController
@property(assign,nonatomic)regisType type;
@end

NS_ASSUME_NONNULL_END
