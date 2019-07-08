//
//  XJOnFreeBuyTableHeaderView.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/2.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJOnFreeBuyTableHeaderView.h"
#import "XJOntimeFreeBuyTimeCell.h"
#import "XJOnTimeFreeBuySectionHeaderView.h"

@interface XJOnFreeBuyTableHeaderView()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(strong,nonatomic)UIImageView *headerImageView;
@property(strong,nonatomic)UICollectionView *timeCollectionView;
@property(strong,nonatomic)XJOnTimeFreeBuySectionHeaderView *sectionHeader;
@end



@implementation XJOnFreeBuyTableHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.timeCollectionView];
        [self.timeCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(self);
            make.height.mas_equalTo(50);
        }];
        
        [self addSubview:self.sectionHeader];
        [self.sectionHeader mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(self);
            make.height.mas_equalTo(@50);
        }];
        
        [self addSubview:self.headerImageView];
        [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self);
            make.top.mas_equalTo(self.timeCollectionView.mas_bottom);
            make.bottom.mas_equalTo(self.sectionHeader.mas_top);
        }];
    }
    return self;
}

-(UIImageView *)headerImageView{
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc]init];
        _headerImageView.image = KDefaultImage;
    }
    return _headerImageView;
}
-(XJOnTimeFreeBuySectionHeaderView *)sectionHeader{
    if (!_sectionHeader) {
        _sectionHeader = [[XJOnTimeFreeBuySectionHeaderView alloc]init];
    }
    return _sectionHeader;
}
-(UICollectionView *)timeCollectionView{
    if (!_timeCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = 1;
        _timeCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _timeCollectionView.delegate = self;
        _timeCollectionView.dataSource = self;
        _timeCollectionView.backgroundColor = RGBA(61, 61, 61, 1);
        [_timeCollectionView registerNib:[UINib nibWithNibName:@"XJOntimeFreeBuyTimeCell" bundle:nil] forCellWithReuseIdentifier:@"XJOntimeFreeBuyTimeCell"];
    }
    return _timeCollectionView;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return CGFLOAT_MIN;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return CGFLOAT_MIN;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XJOntimeFreeBuyTimeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XJOntimeFreeBuyTimeCell" forIndexPath:indexPath];
    if (indexPath.row==4) {
        UIView *view = cell.backgroundView;
        view.backgroundColor =  cell.contentView.backgroundColor =  [UIColor redColor];
    }
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(70, 50);
}



@end
