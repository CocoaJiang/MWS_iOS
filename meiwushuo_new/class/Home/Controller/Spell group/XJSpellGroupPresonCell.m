//
//  XJSpellGroupPresonCell.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/4.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJSpellGroupPresonCell.h"
#import "XJSpellGroupPersonAddCell.h"
#import "XJinduceLabel.h"

@interface XJSpellGroupPresonCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(strong,nonatomic)UIView *bgView;
@property(strong,nonatomic)UICollectionView *TeamcollectionView;
@property(strong,nonatomic)UILabel *title;
@property(strong,nonatomic)XJinduceLabel *induceLabel;
@end

@implementation XJSpellGroupPresonCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        [self addSubview:self.induceLabel];
        [self.induceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(self.contentView);
            make.height.mas_equalTo(@40);
        }];
        [self.contentView addSubview:self.bgView];
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(self.contentView).offset(10);
            make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
            make.bottom.mas_equalTo(self.induceLabel.mas_top);
        }];
        [self.bgView addSubview:self.title];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.bgView.mas_top).offset(20);
            make.centerX.mas_equalTo(self.bgView.mas_centerX);
        }];
        [self.bgView addSubview:self.TeamcollectionView];
        [self.TeamcollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(self.bgView);
            make.top.mas_equalTo(self.title.mas_bottom).offset(20);
        }];
        
      
    }
    return self;
}

-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.masksToBounds = YES;
        _bgView.layer.cornerRadius = 10;
    }
    return _bgView;
}
-(UICollectionView *)TeamcollectionView{
    if (!_TeamcollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _TeamcollectionView  = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _TeamcollectionView.delegate = self;
        _TeamcollectionView.dataSource = self;
        _TeamcollectionView.showsHorizontalScrollIndicator= NO;
        _TeamcollectionView.showsVerticalScrollIndicator = NO;
        _TeamcollectionView.scrollEnabled = NO;
        [_TeamcollectionView registerNib:[UINib nibWithNibName:NSStringFromClass(XJSpellGroupPersonAddCell.class) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass(XJSpellGroupPersonAddCell.class)];
        _TeamcollectionView.backgroundColor  = [UIColor clearColor];
    }
    return _TeamcollectionView;
}
-(UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc]init];
        NSMutableAttributedString *atrt = (NSMutableAttributedString *)[Tools ReturnFontWithString:@"还差" andWithColor:KTEXTCOLOR andWithFont:[UIFont systemFontOfSize:14] andWithString:@"1" andWithColor:KREDCOKOR andWithFont:[UIFont fontWithName:DINAFONT size:20]];
        NSMutableAttributedString *atrt2 = [[NSMutableAttributedString alloc]initWithString:@"人拼团成功" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:KTEXTCOLOR}];
        [atrt appendAttributedString:atrt2];
        _title.attributedText = atrt;
        [_title sizeToFit];
    }
    return _title;
}
-(XJinduceLabel *)induceLabel{
    if (!_induceLabel) {
        _induceLabel = [Tools XJ_XibWithName:NSStringFromClass(XJinduceLabel.class)];
        _induceLabel.labe1.text = @"下单开团/参团 ---";
        _induceLabel.labe2.text = @"邀请好友参团 ---";
        _induceLabel.label3.text = @"人满拼团 ";

    }
    return _induceLabel;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XJSpellGroupPersonAddCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(XJSpellGroupPersonAddCell.class) forIndexPath:indexPath];
    cell.title.hidden = indexPath.row==0?NO:YES;
    if (indexPath.row==4) {
        cell.icon.image = [UIImage imageNamed:@"header_pinTuanPlace"];
    }
    return cell;
}
-(CGSize )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((SCREEN_WIDTH-20)/5, SCREEN_WIDTH/5+10);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return CGFLOAT_MIN;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return CGFLOAT_MIN;
}


@end
