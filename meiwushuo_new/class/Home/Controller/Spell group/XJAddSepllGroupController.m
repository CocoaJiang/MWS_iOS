//
//  XJAddSepllGroupController.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/8.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJAddSepllGroupController.h"
#import "XJSpellGroupPersonAddCell.h"
#import "XJAddSpellGroupTeamReusableView.h"
#import "XJAddSpellGroupForAddFooter.h"
#import <HWPanModal/HWPanModal.h>
#import "XJEqualSpaceFlowLayoutEvolve.h"
@interface XJAddSepllGroupController ()<HWPanModalPresentable>

@end

@implementation XJAddSepllGroupController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view).insets(UIEdgeInsetsMake(0, 40, 0, 40));
    }];
    
    XJEqualSpaceFlowLayoutEvolve *layout = [[XJEqualSpaceFlowLayoutEvolve alloc]initWthType:AlignWithCenter];
    self.collectionView.collectionViewLayout = layout;
    
    //注册 cell 表单
     [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(XJSpellGroupPersonAddCell.class) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass(XJSpellGroupPersonAddCell.class)];
    //注册头部。。.
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(XJAddSpellGroupTeamReusableView.class) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(XJAddSpellGroupTeamReusableView.class)];
    ///注册尾巴
        [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(XJAddSpellGroupForAddFooter.class) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(XJAddSpellGroupForAddFooter.class)];
    
    
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XJSpellGroupPersonAddCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(XJSpellGroupPersonAddCell.class) forIndexPath:indexPath];
    cell.title.hidden = indexPath.row==0?NO:YES;
    if (indexPath.row==4) {
        cell.icon.image = [UIImage imageNamed:@"header_pinTuanPlace"];
        [cell.icon sizeToFit];
    }
    return cell;
}
-(CGSize )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((SCREEN_WIDTH-100)/5, SCREEN_WIDTH/5+10);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return CGFLOAT_MIN;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return CGFLOAT_MIN;
}
#pragma mark - 头部 尾部。。
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind==UICollectionElementKindSectionHeader) {
        XJAddSpellGroupTeamReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(XJAddSpellGroupTeamReusableView.class) forIndexPath:indexPath];
        return header;
    }else{
        XJAddSpellGroupForAddFooter *footer =[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(XJAddSpellGroupForAddFooter.class) forIndexPath:indexPath];
        return footer;
    }
}

#pragma mark - delegate......

-(CGSize )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(SCREEN_WIDTH, iPhoneX?100:60);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(SCREEN_WIDTH, 120);
}

- (PanModalHeight)longFormHeight {
    return PanModalHeightMake(PanModalHeightTypeContent, iPhoneX?350:300); ////到时候这个值写成活的。
}

- (BOOL)showDragIndicator {
    return YES;
}

-(CGFloat)cornerRadius{
    return 20;
}

///动态更新高度。。。。
- (void)onTapChangeLong {
    [self hw_panModalSetNeedsLayoutUpdate];
    [self hw_panModalTransitionTo:PresentationStateLong];
}











@end
