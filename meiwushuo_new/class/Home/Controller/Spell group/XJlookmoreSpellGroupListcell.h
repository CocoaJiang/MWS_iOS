//
//  XJlookmoreSpellGroupList.h
//  meiwushuo_new
//
//  Created by pro on 2019/7/8.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJtableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface XJlookmoreSpellGroupListcell : XJtableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *num;

@end

NS_ASSUME_NONNULL_END
