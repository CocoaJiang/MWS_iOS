//
//  XJHomeController.m
//  meiwushuo_new
//
//  Created by pro on 2019/6/25.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJHomeController.h"
#import "XJHomeBgView.h"
#import "HomeTopView.h"
#import "ZJScrollPageView.h"
#import "XJHomeChildViewController.h"
#import "XJHomeClassListController.h"
@interface XJHomeController ()<ZJScrollPageViewDelegate>
@property(strong,nonatomic)XJHomeBgView *bgView;
@property (weak, nonatomic) ZJScrollPageView *scrollPageView;
@property(strong,nonatomic)NSArray *titles;
@property(strong,nonatomic)UIView *topView_f;
@end

@implementation XJHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    [self.view addSubview:self.bgView];
    
    HomeTopView *topView = [Tools XJ_XibWithName:@"HomeTopView"];
    UIView *topView_f = [[UIView alloc]initWithFrame:CGRectMake(0, kStatusBarHeight, SCREEN_WIDTH, 35)];
    [topView_f addSubview:topView];
    self.topView_f = topView_f;
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(topView_f);
    }];
    [self.view addSubview:topView_f];
    [self addUI];
 
    
}

-(void)addUI{
    self.titles = @[@"鞋帽箱包",
                    @"休闲美食",
                    @"运动周边",
                    @"母婴用品",
                    @"男装"
                    ];
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    style.showCover = NO;
    style.contentViewBounces = NO;
    style.gradualChangeTitleColor = YES;
    style.scaleTitle = YES;
    style.segmentViewBounces=YES;
    style.normalTitleColor = RGBA(255, 255, 255,1);
    style.selectedTitleColor = RGBA(255, 255, 255,1);
    style.titleBigScale = 1.2;
    style.titleFont = [UIFont boldSystemFontOfSize:14];
    style.showLine=NO;
    style.scrollLineColor = RGBA(255, 255, 255,1);
    ZJScrollPageView *scrollPageView = [[ZJScrollPageView alloc]initWithFrame:CGRectMake(0,30+self.topView_f.bootom+5,SCREEN_WIDTH,SCREENH_HEIGHT-35-30-kTabBarHeight) segmentStyle:style titles:self.titles parentViewController:self delegate: self];
    self.scrollPageView = scrollPageView;
    self.scrollPageView.backgroundColor = [UIColor clearColor];
    self.scrollPageView.contentView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.scrollPageView];
    [self.scrollPageView setSelectedIndex:0 animated:NO];
    [self.view addSubview:self.scrollPageView.segmentView];
    self.scrollPageView.segmentView.frame = CGRectMake(0, self.topView_f.bootom, SCREEN_WIDTH, 30);
    self.scrollPageView.segmentView.backgroundColor = [UIColor clearColor];

    
}
- (NSInteger)numberOfChildViewControllers {
    return [self.titles count];
}

- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(XJBaseViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    XJBaseViewController<ZJScrollPageViewChildVcDelegate> *childVc = reuseViewController;
    if (index==0) {
        if (!childVc) {
            childVc = [[XJHomeChildViewController alloc]init];
        }
        return childVc;
    }else{
        if (!childVc) {
            childVc = [[XJHomeClassListController alloc]init];
        }
        return childVc;
        
    }

}
- (void)scrollPageController:(UIViewController *)scrollPageController childViewControllWillAppear:(UIViewController *)childViewController forIndex:(NSInteger)index {
    
}
- (void)scrollPageController:(UIViewController *)scrollPageController childViewControllDidAppear:(UIViewController *)childViewController forIndex:(NSInteger)index {
    
}
- (void)scrollPageController:(UIViewController *)scrollPageController childViewControllWillDisappear:(UIViewController *)childViewController forIndex:(NSInteger)index {
    NSLog(@"%ld ---将要消失",index);
}
- (void)scrollPageController:(UIViewController *)scrollPageController childViewControllDidDisappear:(UIViewController *)childViewController forIndex:(NSInteger)index {
    NSLog(@"%ld ---已经消失",index);
}
- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return NO;
}


-(void)addData{
    NSMutableArray *array = [[NSMutableArray alloc]init];
//    for (QHMallMainModel *model in self.topArr) {
//        [array addObject:model.name];
//    }
    [array insertObject:@"首页" atIndex:0];
    self.titles = (NSArray *)array;
    [self.scrollPageView reloadWithNewTitles:(NSArray *)array];
}

-(XJHomeBgView *)bgView{
    if (!_bgView) {
        _bgView  = [[XJHomeBgView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    }
    return _bgView;
}







@end
