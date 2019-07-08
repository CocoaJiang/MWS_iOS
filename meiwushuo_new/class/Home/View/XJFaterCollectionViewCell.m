//
//  XJFaterCollectionViewCell.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/1.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJFaterCollectionViewCell.h"
#import "XJMianItemCollectionViewCell.h"
#import "XJOntimeFreeBuyController.h"
#import "XJSpellGroupController.h"

@interface XJFaterCollectionViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(strong,nonatomic)UICollectionView *collectionView;
@end

@implementation XJFaterCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.collectionView];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.contentView);
        }];
    }
    return self;
}


-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled=YES;
        _collectionView.showsVerticalScrollIndicator=NO;
        _collectionView.showsHorizontalScrollIndicator=NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerNib:[UINib nibWithNibName:@"XJMianItemCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"XJMianItemCollectionViewCell"];
        _collectionView.pagingEnabled= YES;
    }
    return _collectionView;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XJMianItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XJMianItemCollectionViewCell" forIndexPath:indexPath];
    NSArray *array = @[@"会员免单",@"限时抢购",@"拼团",@"砍价",@"预售",@"同城",@"直播",@"短视频",@"商学院",@"附近好店"];
    cell.title.text = array[indexPath.row];
    NSString *string_pic = [NSString stringWithFormat:@"%@_home_pic",array[indexPath.row]];
    cell.icon.image = [UIImage imageNamed:string_pic];
    return cell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = SCREEN_WIDTH/5;
    CGFloat height = SCREEN_WIDTH/5+20;
    return CGSizeMake(width, height);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return CGFLOAT_MIN;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return CGFLOAT_MIN;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        [[Tools retrunNAV]pushViewController:[XJOntimeFreeBuyController new] animated:YES];
        return;
    }
    if (indexPath.row==2)
    {
        [[Tools retrunNAV]pushViewController:[XJSpellGroupController new] animated:YES];
        return;
    }
}

@end
