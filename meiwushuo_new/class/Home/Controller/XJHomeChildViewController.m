//
//  XJHomeChildViewController.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/1.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJHomeChildViewController.h"
#import "XJMianHeaderView.h"
#import "XJFaterCollectionViewCell.h"
#import "XJCollectionReusableView.h"
#import "XJHomeGoodsCell.h"
#import "XJGoodDetailBigCell.h"
static NSString *const IDSTRING_firstHeader = @"UICollectionReusableView";
static NSString *const IDSTRING_firstfooter = @"UICollectionReusableView_footer";
static NSString *const IDSTRING_OtherHeader = @"XJCollectionReusableView";
static NSString *const IDSTRING_SamallCell  = @"XJHomeGoodsCell";
static NSString *const IDSTRING_BigCell  = @"XJGoodDetailBigCell";
@interface XJHomeChildViewController ()
@property(strong,nonatomic)XJMianHeaderView *headerView;
@end

@implementation XJHomeChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.dataSorces addObjectsFromArray:@[@"1",@"2",@"3",@"4"]];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    self.collectionView.mj_header = [Tools addHeaderRefreshWithBlock:^{
        self.headerView.isLooper = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.collectionView.mj_header endRefreshing];
            self.headerView.isLooper = YES;
        });
    }];
    
    self.collectionView.backgroundColor=self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.collectionView];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:IDSTRING_firstHeader];
    [self.collectionView registerClass:[XJFaterCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass(XJFaterCollectionViewCell.class)];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:IDSTRING_firstfooter];
    [self.collectionView registerNib:[UINib nibWithNibName:IDSTRING_OtherHeader bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:IDSTRING_OtherHeader];
    [self.collectionView registerNib:[UINib nibWithNibName:IDSTRING_SamallCell bundle:nil] forCellWithReuseIdentifier:IDSTRING_SamallCell];
      [self.collectionView registerNib:[UINib nibWithNibName:IDSTRING_BigCell bundle:nil] forCellWithReuseIdentifier:IDSTRING_BigCell];
}
///将要离开就关闭自动轮播
-(void)viewWillDisappear:(BOOL)animated{
    self.headerView.isLooper = NO;
}
-(void)viewWillAppear:(BOOL)animated{
    self.headerView.isLooper = YES;
}

#pragma makr - 处理透明度的问题

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y>SCREEN_WIDTH/17*9) {
        self.collectionView.backgroundColor = [UIColor whiteColor];
         self.headerView.isLooper = NO;
    }else{
        self.collectionView.backgroundColor = [UIColor clearColor];
         self.headerView.isLooper = YES;
    }
}

#pragma mark - 返回有多少组
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
#pragma mark - 头部的大小。。。
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH/17*9);
    }else{
        return CGSizeMake(SCREEN_WIDTH, 30);
    }
}
#pragma mark- footer
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section==0) {
        return CGSizeMake(SCREEN_WIDTH, 100);
    }
    return CGSizeZero;
}
#pragma mark - cell
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        XJFaterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(XJFaterCollectionViewCell.class) forIndexPath:indexPath];
        return cell;
    }else if (indexPath.section==1){
        XJHomeGoodsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:IDSTRING_SamallCell forIndexPath:indexPath];
        return cell;
        
    }else{
        XJGoodDetailBigCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:IDSTRING_BigCell forIndexPath:indexPath];
        return cell;
    }
}
#pragma mark - cell的大小。。。
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return CGSizeMake(SCREEN_WIDTH, (SCREEN_WIDTH/5+20)*2+2);
    }else if (indexPath.section==1){
        return CGSizeMake((SCREEN_WIDTH/2)-1, SCREEN_WIDTH/2+90);
    }else{
        return CGSizeMake(SCREEN_WIDTH, 140);
    }
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 10;
    }
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        if (indexPath.section==0) {
            ////第一组的头 就是轮播图
            UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:IDSTRING_firstHeader forIndexPath:indexPath];
            [header addSubview:self.headerView];
            [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(header);
            }];
            return header;
        }else{
            ///其他组的头部。。
            XJCollectionReusableView *titleheader  = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:IDSTRING_OtherHeader forIndexPath:indexPath];
            return titleheader;
        }
        
    }
    if (indexPath.section==0 && [kind isEqualToString:UICollectionElementKindSectionFooter]) {
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:IDSTRING_firstfooter forIndexPath:indexPath];
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jiaonang"]];;
        [footer addSubview:image];
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(footer);
        }];
        return footer;
    }

    return nil;

}





////首页的滚动图////
-(XJMianHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[XJMianHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/20*9)];
    }
    return _headerView;
}




@end
