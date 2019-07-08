//
//  XJScrollView.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/2.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJScrollView.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
@interface XJScrollView()<SDCycleScrollViewDelegate>
@property(strong,nonatomic)SDCycleScrollView *scrollView;
@end



@implementation XJScrollView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.scrollView];
    }
    return self;
}

-(void)layoutSubviews{
    self.scrollView.frame  = self.bounds;
}

-(SDCycleScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:KDefaultImage];
    }
    return _scrollView;
}

-(void)setImageArray:(NSArray *)imageArray{
    _imageArray = imageArray;
    _scrollView.localizationImageNamesGroup = imageArray;
}

- (void)scrollViewDidScroll:(CGFloat)contentOffsetY {
//    CGRect frame = self.scrollView.frame;
//    frame.size.height -= contentOffsetY;
//    frame.origin.y = contentOffsetY;
//    self.scrollView.frame = frame;
}




@end
