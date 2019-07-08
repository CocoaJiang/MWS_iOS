//
//  XJAddressManagerController.h
//  iphoneLive
//
//  Created by Mac on 2019/6/5.
//  Copyright © 2019 美物说. All rights reserved.
//

#import "XJBaseViewController.h"
@class XJaddRessManager;
typedef NS_ENUM(NSInteger ,managerType){
    addressManager=0,
    choseAddress=1,
};
NS_ASSUME_NONNULL_BEGIN
@interface XJAddressManagerController : XJBaseViewController
@property(assign,nonatomic)managerType type;
@property(copy,nonatomic)void(^choseAddress)(XJaddRessManager *addressModel);
@end

NS_ASSUME_NONNULL_END
