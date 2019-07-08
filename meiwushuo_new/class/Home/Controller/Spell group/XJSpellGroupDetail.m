//
//  XJSpellGroupDetail.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/3.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJSpellGroupDetail.h"
#import "XJSpellBootomView.h"
#import "XJScrollView.h"
#import "XJSpellTitleCell.h"
#import "XJSpellGroupInduce.h"
#import "ZSDTCoreTextTools.h"
#import "UIImageView+WebCache.h"
#import "XJSpellGroupDoAngThingController.h"
#import "XJSpecificationsPOPController.h"

////查看更多。。。。。。。。
#import "XJAddSpellGroupListController.h"

#import "XJAddSepllGroupController.h"
//////拼团人数的Cell
#import "XJSpeellGroupDetailPersonCell.h"
////这是介绍。。。
#import "XJSepllGroupInduceLabel.h"
////详情的空间。。。。。。
@interface XJSpellGroupDetail ()<DTAttributedTextContentViewDelegate,DTLazyImageViewDelegate>
@property(strong,nonatomic)XJSpellBootomView *bootomView;
@property(strong,nonatomic)XJScrollView *scrollView;
@property(strong,nonatomic)UIButton *backButton;
@property(strong,nonatomic)UIButton *sharButton;
@property(assign,nonatomic)CGFloat webCellHeight;
@property (nonatomic, copy) NSString *cellID_DTCoreText;
//类似tabelView的缓冲池，用于存放图片大小
@property (nonatomic, strong) NSCache *imageSizeCache;
@property (nonatomic,strong)NSCache *cellCache;
/////顶部的View
@property(strong,nonatomic)UIView *topView;
///高度引用
@end

@implementation XJSpellGroupDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    _imageSizeCache = [[NSCache alloc] init];
    _cellCache = [[NSCache alloc] init];
    _cellCache.totalCostLimit = 10;
    _cellCache.countLimit = 10;
    self.cellID_DTCoreText = @"DTCoreTextTableViewCellID";
    [self.view addSubview:self.bootomView];
    [self.view addSubview:self.tableView];
    [self.bootomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.mas_equalTo(self.view.mas_bottom);
        }
        make.height.mas_equalTo(@45);
    }];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.bootomView.mas_top);
    }];
    [self.tableView XJRegisCellWithNibWithName:NSStringFromClass(XJSpellTitleCell.class)];
    [self.tableView XJRegisCellWithNibWithName:NSStringFromClass(XJSpellGroupInduce.class)];
    [self.tableView XJRegisCellWithNibWithName:NSStringFromClass(XJSpeellGroupDetailPersonCell.class)];
    [self.tableView XJRegisCellWithNibWithName:NSStringFromClass(XJSepllGroupInduceLabel.class)];
    
    [self tableView:self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:4]];
    self.tableView.tableHeaderView  = self.scrollView;
    [self.view addSubview:self.topView];
    self.topView.hidden = YES;
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.sharButton];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.top.mas_equalTo(self.view.mas_top).offset(iPhoneX?45:30);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [self.sharButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view.mas_right).offset(-20);
        make.top.mas_equalTo(self.view.mas_top).offset(iPhoneX?45:30);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    UILabel *label = [[UILabel alloc]init];
    label.text = @"拼团详情";
    [label sizeToFit];
    [_topView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.topView.mas_centerX);
        make.top.mas_equalTo(self.view.mas_top).offset(iPhoneX?50:35);
    }];

}

#pragma mark - 返回分组数量
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
#pragma mark - 返回数量
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==3||section==2) {
        return 2;
    }else{
        return 1;
    }
}
#pragma mark - 返回cell 的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 140;
            break;
        case 1:
            return 40;
            break;
        case 2:
            return 60;
            break;
        case 3:
            return indexPath.row==0?70:60;
            break;
        case 4:
        {
            DTAttributedTextCell *cell = (DTAttributedTextCell *)[self tableView:tableView prepareCellForIndexPath:indexPath];
            CGFloat height = [cell requiredRowHeightInTableView:tableView];
            NSLog(@"%f",height);
            
            if (height<50) {
                return 100;
            }
            return height;
           
        }
            break;
        default: return CGFLOAT_MIN;
            break;
    }
    
    
    
    
}



#pragma mark - 返回定制的Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
 
    switch (indexPath.section) {
        case 0:
        {
            XJSpellTitleCell *cell =  [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(XJSpellTitleCell.class)];
            return cell;
        }
            break;
            
        case 1:
        {
            XJSepllGroupInduceLabel *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(XJSepllGroupInduceLabel.class)];
            return cell;
        }
            break;
            
        case 2:
        {
            XJSpeellGroupDetailPersonCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(XJSpeellGroupDetailPersonCell.class)];
            __weak typeof(self)weakSelf =self;
            cell.goSpellGroup.clickAction = ^(UIButton *button) {
                [weakSelf presentPanModal:[XJAddSepllGroupController new]];
            };
            return cell;
            
        }
            break;
            
        case 3:
        {
            XJSpellGroupInduce *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(XJSpellGroupInduce.class)];
            cell.leteImage.hidden =![[NSString stringWithFormat:@"%ld",(long)indexPath.row] boolValue];
            if (indexPath.row==0) {
                cell.indecelabel.text = @"拼团玩法\n\n开团并邀请好友参团，人数不足自动退款";
            }else{
                cell.indecelabel.text = @"参数介绍";
            }
            return cell;
        }
            break;
            
        case 4:
        {
            DTAttributedTextCell *dtCell = (DTAttributedTextCell *) [self tableView:tableView prepareCellForIndexPath:indexPath];
            return dtCell;
            
        }  break;
            
        default: return nil;
            break;
    }

}

#pragma mark - 点击相应效果。。。。

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==3 && indexPath.row==1) {
        XJSpecificationsPOPController *controller = [[XJSpecificationsPOPController alloc]init];
        [self presentPanModal:controller];
        return;
    }else if (indexPath.row==0 && indexPath.section==1){
        XJAddSpellGroupListController *controller = [[XJAddSpellGroupListController alloc]init];
        [self presentPanModal:controller];
        return;
    }
    
    
}





#pragma mark - DTAttributedTextContentViewDelegate
//对于没有在Html标签里设置宽高的图片，在这里为其设置占位
- (UIView *)attributedTextContentView:(DTAttributedTextContentView *)attributedTextContentView viewForAttachment:(DTTextAttachment *)attachment frame:(CGRect)frame{
    if([attachment isKindOfClass:[DTImageTextAttachment class]]){
        ZSDTLazyImageView *imageView = [[ZSDTLazyImageView alloc] initWithFrame:frame];
        imageView.delegate = self;
        imageView.image = [(DTImageTextAttachment *)attachment image];
        imageView.textContentView = attributedTextContentView;
        imageView.url = attachment.contentURL;
        return imageView;
    }
    return nil;
}


//对于无宽高懒加载得到的图片，缓存记录其大小,然后执行表视图更新
- (void)lazyImageView:(ZSDTLazyImageView *)lazyImageView didChangeImageSize:(CGSize)size{
    BOOL needUpdate = NO;
    NSURL *url = lazyImageView.url;
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"contentURL == %@", url];
    /* update all attachments that matchin this URL (possibly multiple
     images with same size)
     */
    for (DTTextAttachment *oneAttachment in [lazyImageView.textContentView.layoutFrame textAttachmentsWithPredicate:pred]){
        // update attachments that have no original size, that also sets the display size
        if (CGSizeEqualToSize(oneAttachment.originalSize, CGSizeZero)){
            oneAttachment.originalSize = size;
            NSValue *sizeValue = [_imageSizeCache objectForKey:oneAttachment.contentURL];
            if (!sizeValue) {
                //将图片大小记录在缓存中，但是这种图片的原始尺寸可能很大，所以这里设置图片的最大宽
                //并且计算高
                CGFloat aspectRatio = size.height / size.width;
                CGFloat width = ZSToolScreenWidth - 15*2;
                CGFloat height = width * aspectRatio;
                CGSize newSize = CGSizeMake(width, height);
                [_imageSizeCache setObject:[NSValue valueWithCGSize:newSize]forKey:url];
            }
            needUpdate = YES;
        }
    }
    
    if (needUpdate){
        //有新的图片尺寸被缓存记录的时候，需要刷新表视图
        //[self reloadCurrentCell];
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(reloadCurrentCell) object:nil];
      //  self.isScrolling = NO;
        [self performSelector:@selector(reloadCurrentCell) withObject:nil afterDelay:0.1];
    }
}

#pragma mark - private Methods
//创建富文本单元格，并更新单元格上的数据
- (DTAttributedTextCell *)tableView:(UITableView *)tableView prepareCellForIndexPath:(NSIndexPath *)indexPath{
    NSString *key = [NSString stringWithFormat:@"dtCoreTextCellKEY%ld-%ld", (long)indexPath.section, (long)indexPath.row];
    DTAttributedTextCell *cell = [_cellCache objectForKey:key];
    if (!cell){
        cell = [[DTAttributedTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:_cellID_DTCoreText];
        cell.attributedTextContextView.edgeInsets = UIEdgeInsetsMake(0, 15, 0, 15);
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.hasFixedRowHeight = NO;
        cell.textDelegate = self;
        cell.attributedTextContextView.shouldDrawImages = YES;
        //记录在缓存中
        [_cellCache setObject:cell forKey:key];
    }
    
    [cell setHTMLString:@"甜多多烤红薯-不甜不要钱<img src=\"http://mwsbest.mwsvip.cn/data/upload/ueditor/20190521/5ce40c0c9956f.jpg\" style=\"white-space: normal;\"/><img src=\"http://mwsbest.mwsvip.cn/data/upload/ueditor/20190521/5ce40c1229a67.jpg\" style=\"white-space: normal;\"/><img src=\"http://mwsbest.mwsvip.cn/data/upload/ueditor/20190521/5ce40c1b8c0d1.jpg\" style=\"white-space: normal;\"/><img src=\"http://mwsbest.mwsvip.cn/data/upload/ueditor/20190521/5ce40c1f8fd9a.jpg\" style=\"white-space: normal;\"/><img src=\"http://mwsbest.mwsvip.cn/data/upload/ueditor/20190521/5ce40c2367837.jpg\" style=\"white-space: normal;\"/><img src=\"http://mwsbest.mwsvip.cn/data/upload/ueditor/20190521/5ce40c26d55e8.jpg\" style=\"white-space: normal;\"/><img src=\"http://mwsbest.mwsvip.cn/data/upload/ueditor/20190521/5ce40c2d7a1ff.jpg\" style=\"white-space: normal;\"/></p>"];
    //2.2为每个占位图(图片)设置大小，并更新
    for (DTTextAttachment *oneAttachment in cell.attributedTextContextView.layoutFrame.textAttachments) {
        NSValue *sizeValue = [_imageSizeCache objectForKey:oneAttachment.contentURL];
        if (sizeValue) {
            cell.attributedTextContextView.layouter=nil;
            oneAttachment.displaySize = [sizeValue CGSizeValue];
            [cell.attributedTextContextView relayoutText];
            
        }
    }
    [cell.attributedTextContextView relayoutText];

    return cell;
}


- (void)reloadCurrentCell{
    //如果当前表视图在滑动就不执行刷新，因为滑动时候会自动调用表视图的刷新方法
//    if (self.isScrolling) {
//        return;
//    }
    //如果当前表视图没有在滑动，就手动刷新当前在屏幕显示的单元格
    NSArray *indexPaths = [self.tableView indexPathsForVisibleRows];
    if(indexPaths){
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
        });
    }
}







#pragma mark - 处理头部效果。。

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.topView.hidden = scrollView.contentOffset.y>SCREEN_WIDTH?NO:YES;
    
}

#pragma mark - 懒加载部分//////
-(XJScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[XJScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH)];
        _scrollView.imageArray = @[[UIImage imageNamed:@"goodsplace"],[UIImage imageNamed:@"goodsplace"]];
    }
    return _scrollView;
}
-(XJSpellBootomView *)bootomView{
    if (!_bootomView) {
        _bootomView = [Tools XJ_XibWithName:NSStringFromClass(XJSpellBootomView.class)];
        _bootomView.buyNowButton.clickAction = ^(UIButton *button) {
            [[Tools retrunNAV] pushViewController:[XJSpellGroupDoAngThingController new] animated:YES];
        };
    }
    return _bootomView;
}
-(UIButton *)backButton{
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateNormal];
        [_backButton setBackgroundColor:[UIColor whiteColor]];
        _backButton.size = CGSizeMake(30, 30);
        _backButton.layer.masksToBounds = YES;
        _backButton.layer.cornerRadius  =15;
        __weak typeof(self)weakSelf = self;
        _backButton.clickAction = ^(UIButton *button) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        };
    }
    return _backButton;
}

-(UIButton *)sharButton{
    if (!_sharButton) {
        _sharButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sharButton setImage:[UIImage imageNamed:@"zhuanfa"] forState:UIControlStateNormal];
        [_sharButton setBackgroundColor:[UIColor whiteColor]];
        _sharButton.size = CGSizeMake(30, 30);
        _sharButton.layer.masksToBounds = YES;
        _sharButton.layer.cornerRadius  =15;
    }
    return _sharButton;
}

-(UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc]init];
        _topView.backgroundColor = [UIColor whiteColor];
        _topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kTopHeight);
    }
    return _topView;
}







@end
