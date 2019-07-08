//
//  XJSpellGroupController.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/2.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJSpellGroupController.h"
#import "XJScrollView.h"
#import <JXCategoryView.h>
#import "XJSpellChildViewController.h"
#import "XJSpellGroupDetail.h"
#import "JXPagerView.h"
@interface XJSpellGroupController ()<JXPagerViewDelegate, JXCategoryViewDelegate>
@property(strong,nonatomic)XJScrollView *scrollView;
@property (nonatomic, strong) JXCategoryTitleImageView *titleView;
@property (nonatomic, strong) JXPagerView *pagingView;
@property(assign,nonatomic)NSInteger  height;
@end


@implementation XJSpellGroupController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"拼团";
    [self.view addSubview:self.titleView];
    //中和手势
    self.height = SCREEN_WIDTH/20*9;
    
    _pagingView = [[JXPagerView alloc] initWithDelegate:self];
    [self.view addSubview:self.pagingView];
    self.titleView.contentScrollView = self.pagingView.listContainerView.collectionView;
    [self tz_addPopGestureToView:self.pagingView.mainTableView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.pagingView.frame = self.view.bounds;
}


#pragma mark - 懒加载。。。。。。
-(XJScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[XJScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.height)];
    }
    return _scrollView;
}

-(JXCategoryTitleImageView *)titleView{
    if (!_titleView) {
        _titleView = [[JXCategoryTitleImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 63)];
        _titleView.delegate = self;
        _titleView.titles = @[@"三人团", @"五人团", @"十人团"];
        _titleView.titleColorGradientEnabled = YES;
        _titleView.imageNames = @[@"3ren",@"5ren",@"10ren"];
        _titleView.selectedImageNames =@[@"3ren",@"5ren",@"10ren"];
        _titleView.imageZoomEnabled = YES;
        _titleView.imageZoomScale = 1.3;
        _titleView.averageCellSpacingEnabled = NO;
        JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
        lineView.lineStyle  = JXCategoryIndicatorLineStyle_Lengthen;
        lineView.indicatorWidth = 20;
        _titleView.indicators = @[lineView];
        _titleView.imageTypes = @[@(JXCategoryTitleImageType_TopImage),
                                  @(JXCategoryTitleImageType_TopImage),
                                  @(JXCategoryTitleImageType_TopImage)];
        _titleView.cellSpacing = CGFLOAT_MIN;
        _titleView.cellWidth = SCREEN_WIDTH/3;
      
        
        
    }
    return _titleView;
}


#pragma mark - JXPagingViewDelegate

- (UIView *)tableHeaderViewInPagerView:(JXPagerView *)pagerView {
    return self.scrollView;
}

- (NSUInteger)tableHeaderViewHeightInPagerView:(JXPagerView *)pagerView {
    return self.height;
}

- (NSUInteger)heightForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return 63;
}

- (UIView *)viewForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return self.titleView;
}

- (NSInteger)numberOfListsInPagerView:(JXPagerView *)pagerView {
    return 3;
}

- (XJSpellChildViewController<JXPagerViewListViewDelegate> *)pagerView:(JXPagerView *)pagerView initListAtIndex:(NSInteger)index {
    XJSpellChildViewController *list = [[XJSpellChildViewController alloc] init];
    return list;
}

- (void)mainTableViewDidScroll:(UIScrollView *)scrollView {
    [self.scrollView scrollViewDidScroll:scrollView.contentOffset.y];
}

@end
