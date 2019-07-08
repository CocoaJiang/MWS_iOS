//
//  QHSelsecAreaView.h
//  CarCheck
//
//  Created by 领投科技 on 2018/5/14.
//  Copyright © 2018年 zhangqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QHSelsecAreaView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,retain)UIView * pickView;
@property (nonatomic,retain)UILabel * TitleLabel;
@property (nonatomic,retain)UIPickerView * pick;
@property (nonatomic,retain)NSMutableArray * ProvinceArr;
@property (nonatomic,retain)NSMutableArray * cityArr;
@property (nonatomic,retain)NSMutableArray * areaArr;

-(void)getAreaDataWithComponent:(NSInteger)component proviceID:(NSString *)proviceID andCityID:(NSString *)cityID;

@property (nonatomic,copy)void (^areaBlock)(NSString * proviceID,NSString * cityID,NSString * areaID,NSString * proviceName,NSString * cityName,NSString * areaName);

@end
