//
//  XJMianHeaderView.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/1.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJMianHeaderView.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
#import "XJSCorllViewControllerCell.h"
#import <SOZOChromoplast/SOZOChromoplast.h>
@interface XJMianHeaderView()<SDCycleScrollViewDelegate>
@property(strong,nonatomic)SDCycleScrollView *scrollView;
@property(strong,nonatomic)NSMutableArray *imageArray;
@property(strong,nonatomic)NSMutableArray *dict_colors;
@end


@implementation XJMianHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        for (int index = 0; index < 9; index++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"Yosemite%02d",index]];
            [self.imageArray addObject:image];
        }
        [self addSubview:self.scrollView];
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        if ([self.imageArray count]>0){
            NSDictionary *dict= [self mostColor:self.imageArray[0]andWithID:0];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"COLORISCHANGE" object:nil userInfo:dict];
        };
    }
    return self;
}

-(SDCycleScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:nil];
        _scrollView.pageControlStyle = SDCycleScrollViewPageContolStyleNone;
        _scrollView.localizationImageNamesGroup = self.imageArray;
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.autoScrollTimeInterval = 3;
    }
    return _scrollView;
}

-(Class )customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view{
    return [XJSCorllViewControllerCell class];
}
-(void)setupCustomCell:(XJSCorllViewControllerCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view{
    cell.XJimageView.image = self.imageArray[index];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    if ([self.imageArray count]<0) return;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if (self.isLooper) {
            NSDictionary *dict= [self mostColor:self.imageArray[index] andWithID:index];
            [[NSNotificationCenter defaultCenter]postNotificationName:@"COLORISCHANGE" object:nil userInfo:dict];
        }
    });
     
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


-(NSMutableArray *)imageArray{
    if (!_imageArray) {
        _imageArray = [[NSMutableArray alloc]init];
    }
    return _imageArray;
}


-(NSDictionary*)mostColor:(UIImage*)image andWithID:(NSInteger)index{
    
  ////先判断有没有值
    if ([self.dict_colors count]>index+1) {
        return self.dict_colors[index];
    }else{
        SOZOChromoplast *chromoplast = [[SOZOChromoplast alloc]initWithImage:image];
        NSDictionary *dict = @{
                               @"MAINCOLOR":chromoplast.dominantColor,
                               @"FIRSTCOLOR":chromoplast.firstHighlight,
                               @"ID_SCROLLVIEW":@(index),
                               };
        [self.dict_colors addObject:dict];
        return dict;
    }
}

-(NSMutableArray *)dict_colors{
    if (!_dict_colors) {
        _dict_colors = [[NSMutableArray alloc]init];
    }
    return _dict_colors;
}

-(void)setIsLooper:(BOOL)isLooper{
    _isLooper = isLooper;
    //不让他自动滚动了
    self.scrollView.autoScroll = isLooper;;
    
}




@end
