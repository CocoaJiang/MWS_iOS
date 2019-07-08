//
//  XJAddAddressController.h
//  iphoneLive
//
//  Created by Mac on 2019/6/6.
//  Copyright © 2019 美物说. All rights reserved.
//

#import "XJBaseViewController.h"
#import "XJAddAddressController.h"
#import "XJaddRessManager.h"
NS_ASSUME_NONNULL_BEGIN

@interface XJAddAddressController : XJBaseViewController
@property(copy,nonatomic)dispatch_block_t refush;
@property(strong,nonatomic)XJaddRessManager *model;

@end

NS_ASSUME_NONNULL_END
