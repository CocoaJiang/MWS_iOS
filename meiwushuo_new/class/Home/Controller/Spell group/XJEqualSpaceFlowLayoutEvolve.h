//
//  XJEqualSpaceFlowLayoutEvolve.h
//  meiwushuo_new
//
//  Created by pro on 2019/7/8.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,AlignType){
    AlignWithLeft,
    AlignWithCenter,
    AlignWithRight
};
NS_ASSUME_NONNULL_BEGIN

@interface XJEqualSpaceFlowLayoutEvolve : UICollectionViewFlowLayout
@property (nonatomic,assign)CGFloat betweenOfCell;
@property (nonatomic,assign)AlignType cellType;
-(instancetype)initWthType:(AlignType)cellType;
@end

NS_ASSUME_NONNULL_END
