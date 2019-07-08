//
//  XJAddressManagerCell.h
//  iphoneLive
//
//  Created by Mac on 2019/6/5.
//  Copyright © 2019 美物说. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XJaddRessManager;
NS_ASSUME_NONNULL_BEGIN

@interface XJAddressManagerCell : UITableViewCell
@property(strong,nonatomic)XJaddRessManager *model;
@property(copy,nonatomic)void(^chosedefultAddressBlock)(XJaddRessManager *model);
@property(copy,nonatomic)void(^editAddress)(XJaddRessManager *model);

@end

NS_ASSUME_NONNULL_END
