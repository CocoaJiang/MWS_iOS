//
//  XJSpellGroupDoAngThingController.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/4.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJSpellGroupDoAngThingController.h"
#import "XJSpellGropuHeaderGoods.h" //商品。。。。。。
#import "XJSpellGroupGoodsFoot.h"///底部的按钮
#import "XJSpellGroupHeaderCell.h"
#import "XJSpellGroupMoreHeader.h" //更多的标题/。///
#import "XJHomeGoodsCell.h"
#import "XJMakeOrderController.h"
#import "XJSpellGroupSuccessController.h"

@interface XJSpellGroupDoAngThingController ()

@end

@implementation XJSpellGroupDoAngThingController


-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title  = @"拼团操作";
    [self.dataSorces addObjectsFromArray:self.expArray];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    self.collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    ////注册部分
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(XJSpellGroupHeaderCell.class) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass(XJSpellGroupHeaderCell.class)];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(XJSpellGropuHeaderGoods.class) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(XJSpellGropuHeaderGoods.class)];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(XJSpellGroupGoodsFoot.class) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(XJSpellGroupGoodsFoot.class)];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(XJSpellGroupMoreHeader.class) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(XJSpellGroupMoreHeader.class)];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(XJHomeGoodsCell.class) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass(XJHomeGoodsCell.class)];
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        XJSpellGroupHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(XJSpellGroupHeaderCell.class) forIndexPath:indexPath];
        return cell;
    }else{
        XJHomeGoodsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(XJHomeGoodsCell.class) forIndexPath:indexPath];
        cell.type = XJSPellGroup;
        return cell;
    }
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            XJSpellGropuHeaderGoods *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(XJSpellGropuHeaderGoods.class) forIndexPath:indexPath];
            UITapGestureRecognizer *zer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(back)];
            header.userInteractionEnabled = YES;
            [header addGestureRecognizer:zer];
            return header;
        }else{
            XJSpellGroupGoodsFoot *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass(XJSpellGroupGoodsFoot.class) forIndexPath:indexPath];
            footer.openTeam.clickAction = ^(UIButton *button) {
                XJNavigationController *nav = [[UIApplication sharedApplication]visibleNavigationController];
                [nav pushViewController:[XJMakeOrderController new] animated:YES];
            };
            footer.addTeamButton.clickAction = ^(UIButton *button) {
                XJNavigationController *nav = [[UIApplication sharedApplication]visibleNavigationController];
                [nav pushViewController:[XJSpellGroupSuccessController new] animated:YES];
            };
            return footer;
        }
    }else{
        if (kind==UICollectionElementKindSectionHeader) {
          XJSpellGroupMoreHeader *headerModre = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass(XJSpellGroupMoreHeader.class) forIndexPath:indexPath];
            return headerModre;
        }
    }
    return nil;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
         return CGSizeMake(SCREEN_WIDTH, 30);
    }else{
         return CGSizeMake((SCREEN_WIDTH/2), SCREEN_WIDTH/2+90);
    }
}
-(CGSize )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return CGSizeMake(SCREEN_WIDTH, 100);
    }else if (section==1){
        return CGSizeMake(SCREEN_WIDTH, 60);
    }
    return CGSizeZero;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(SCREEN_WIDTH, 140);
    }
    return CGSizeZero;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    return [self.dataSorces count];
}

@end
