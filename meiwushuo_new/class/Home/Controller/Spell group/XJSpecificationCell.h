//
//  XJSpecificationCell.h
//  meiwushuo_new
//
//  Created by pro on 2019/7/8.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJtableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface XJSpecificationCell : XJtableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *content;

@end

NS_ASSUME_NONNULL_END
