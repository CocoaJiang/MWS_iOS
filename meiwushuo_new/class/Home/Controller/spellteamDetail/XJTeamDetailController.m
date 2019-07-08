//
//  XJTeamDetailController.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/6.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJTeamDetailController.h"
#import <JXCategoryView.h>
#import "XJSpellChildViewController.h"
#import "SpellDetailListController.h"
@interface XJTeamDetailController ()<JXCategoryViewDelegate,JXCategoryListContainerViewDelegate>
@property (nonatomic, strong) JXCategoryTitleView *titleView;
@property (nonatomic, strong) JXCategoryListContainerView *listContainerView; ////这个是滚动的那个试图。。。
@end

@implementation XJTeamDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.listContainerView];
    self.title = @"团详情";
    self.listContainerView.didAppearPercent = 0.01; //滚动一点就触发加载
    [self.listContainerView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.titleView.mas_bottom);
    }];
    _titleView.contentScrollView = self.listContainerView.scrollView;
    self.listContainerView.backgroundColor = KBGCOLOR;
    
    //中和手势
    [self tz_addPopGestureToView:self.listContainerView.scrollView];
    
}

-(JXCategoryTitleView *)titleView{
    if (!_titleView) {
        _titleView = [[JXCategoryTitleView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, 40)];
        _titleView.delegate = self;
        _titleView.titles = @[@"拼团详情", @"组团成功", @"组团失败"];
        _titleView.titleColorGradientEnabled = YES;
        _titleView.averageCellSpacingEnabled = NO;
        JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
        lineView.lineStyle  = JXCategoryIndicatorLineStyle_Lengthen;
        lineView.indicatorWidth = 20;
        _titleView.indicators = @[lineView];
        _titleView.cellSpacing = CGFLOAT_MIN;
        _titleView.cellWidth = SCREEN_WIDTH/3;
    }
    return _titleView;
}
-(JXCategoryListContainerView *)listContainerView{
    if (!_listContainerView) {
        _listContainerView = [[JXCategoryListContainerView alloc]initWithDelegate:self];
    }
    return _listContainerView;
}

#pragma mark - JXCategoryListContentViewDelegate

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    id<JXCategoryListContentViewDelegate> list = [self preferredListAtIndex:index];
    return list;
}

- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return 3;
}
- (id<JXCategoryListContentViewDelegate>)preferredListAtIndex:(NSInteger)index {
    SpellDetailListController *controller = [[SpellDetailListController alloc]init];
    return controller;
}

#pragma mark - JXCategoryViewDelegate

- (void)categoryView:(JXCategoryBaseView *)categoryView didScrollSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didClickSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [self.listContainerView didClickSelectedItemAtIndex:index];
}

- (void)categoryView:(JXCategoryBaseView *)categoryView scrollingFromLeftIndex:(NSInteger)leftIndex toRightIndex:(NSInteger)rightIndex ratio:(CGFloat)ratio {
    [self.listContainerView scrollingFromLeftIndex:leftIndex toRightIndex:rightIndex ratio:ratio selectedIndex:categoryView.selectedIndex];
}



@end
