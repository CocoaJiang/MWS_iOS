//
//  QHSelsecAreaView.m
//  CarCheck
//
//  Created by 领投科技 on 2018/5/14.
//  Copyright © 2018年 zhangqiang. All rights reserved.
//

#import "QHSelsecAreaView.h"

@implementation QHSelsecAreaView



-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    self.ProvinceArr = [NSMutableArray array];
    self.cityArr = [NSMutableArray array];
    self.areaArr = [NSMutableArray array];
    self.hidden = YES;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    [self addGestureRecognizer:tap];
    
    //背景视图
    self.pickView=[[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, 230)];
    self.pickView.backgroundColor=RGBA(247, 247, 247,1);
    [self addSubview:self.pickView];
    [self.pickView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
        
        make.top.equalTo(self.mas_bottom).offset(0);
        make.bottom.equalTo(self.mas_bottom).offset(230);
    }];
    //左侧取消按钮
    UIButton * leftButton=[UIButton buttonWithType:UIButtonTypeSystem];
    leftButton.frame=CGRectMake(0, 0, 50, 40);
    [leftButton setTitle:@"取消" forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(PickButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
    leftButton.titleLabel.font=[UIFont systemFontOfSize:15];
    [self.pickView addSubview:leftButton];
    //右侧确定按钮
    UIButton * RightButton=[UIButton buttonWithType:UIButtonTypeSystem];
    RightButton.frame=CGRectMake(self.frame.size.width-50, 0, 50, 40);
    [RightButton setTitle:@"确定" forState:UIControlStateNormal];
    [RightButton addTarget:self action:@selector(PickButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [RightButton setTitleColor:KREDCOKOR forState:UIControlStateNormal];
    RightButton.titleLabel.font=[UIFont systemFontOfSize:15];
    [self.pickView addSubview:RightButton];
    //标题
    self.TitleLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width/2-70, 0, 140, 40)];
    self.TitleLabel.text=@"";
    self.TitleLabel.textColor=RGB(51, 51, 51);
    self.TitleLabel.textAlignment=NSTextAlignmentCenter;
    self.TitleLabel.font=[UIFont systemFontOfSize:18];
    [self.pickView addSubview:self.TitleLabel];
    
    //UIPickView
    self.pick=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 40, self.frame.size.width, 190)];
    self.pick.delegate=self;
    self.pick.dataSource=self;
    self.pick.backgroundColor = [UIColor whiteColor];
    [self.pickView addSubview:self.pick];
}
-(void)tapClick
{
    [self.pickView mas_updateConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            
//            make.top.equalTo(self.mas_safeAreaLayoutGuideBottom).offset(0);
            make.top.equalTo(self.mas_bottom).offset(0);
        } else {
            make.top.equalTo(self.mas_bottom).offset(0);
        }
        make.bottom.equalTo(self.mas_bottom).offset(230);
    }];
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
        [self.pickView layoutIfNeeded];
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    }completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}
-(void)PickButtonClick:(UIButton *)button
{
    [self.pickView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.mas_bottom).offset(0);
        
        make.bottom.equalTo(self.mas_bottom).offset(230);
    }];
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
        [self.pickView layoutIfNeeded];
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    } completion:^(BOOL finished) {
        self.hidden = YES;
        if ([button.titleLabel.text isEqualToString:@"确定"]) {
            NSInteger selectOne = [self.pick selectedRowInComponent:0];
            NSInteger selectTwo = [self.pick selectedRowInComponent:1];
            NSInteger selectThree = [self.pick selectedRowInComponent:2];
            NSString * priviceName = [[self.ProvinceArr objectAtIndex:selectOne] objectForKey:@"name"];
            NSString * priviceID = [NSString stringWithFormat:@"%@",[[self.ProvinceArr objectAtIndex:selectOne] objectForKey:@"id"]];
            NSString * cityName = [[self.cityArr objectAtIndex:selectTwo] objectForKey:@"name"];
            NSString * cityID = [NSString stringWithFormat:@"%@",[[self.cityArr objectAtIndex:selectTwo] objectForKey:@"id"]];
            NSString * areaName = [[self.areaArr objectAtIndex:selectThree] objectForKey:@"name"];
            NSString * areaID = [NSString stringWithFormat:@"%@",[[self.areaArr objectAtIndex:selectThree] objectForKey:@"id"]];
            
            if (self.areaBlock) {
                self.areaBlock(priviceID, cityID, areaID, priviceName,cityName,areaName);
            }
        }
    }];
    
}
#pragma mark pickViewDelegate
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component==0) {
        return self.ProvinceArr.count;
    }else if(component == 1){
        return self.cityArr.count;
    }else{
        return self.areaArr.count;
    }
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    CGFloat width = (self.frame.size.width - 40)/3;
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, width, 30)];
    label.adjustsFontSizeToFitWidth = YES;
    if (component==0) {
        label.text = self.ProvinceArr[row][@"name"];
    }else if(component == 1){
        label.text = self.cityArr[row][@"name"];
    }else{
        label.text = self.areaArr[row][@"name"];
    }
    CGFloat font = 18;
    
    if (self.frame.size.width == 320) {
        font = 15;
    }else if (self.frame.size.width == 375){
        font = 17;
    }else{
        font = 18;
    }
    
    label.textColor = RGB(51, 51, 51);
    label.font = [UIFont systemFontOfSize:font];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}


-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 38;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component==0) {
//        [pickerView selectRow:0 inComponent:1 animated:NO];//带动画容易出现页面卡丢
//        [pickerView selectRow:0 inComponent:2 animated:NO];
        NSString * proviceID = [NSString stringWithFormat:@"%@",[[self.ProvinceArr objectAtIndex:row] objectForKey:@"id"]];
        NSInteger selectcity = [pickerView selectedRowInComponent:1];
        NSString * cityID = [NSString stringWithFormat:@"%@",[[self.cityArr objectAtIndex:selectcity] objectForKey:@"id"]];
        [self getAreaDataWithComponent:component proviceID:proviceID andCityID:cityID];
    }else if(component == 1){
//        [pickerView selectRow:0 inComponent:2 animated:NO];
        NSString * cityID = [[self.cityArr objectAtIndex:row] objectForKey:@"id"];
        NSInteger selectprovice = [pickerView selectedRowInComponent:0];
        NSString * proviceID = [NSString stringWithFormat:@"%@",[[self.ProvinceArr objectAtIndex:selectprovice] objectForKey:@"id"]];
        [self getAreaDataWithComponent:component proviceID:proviceID andCityID:cityID];
    }
    
}

/**
 获取省市县数据

 @param component 0：滑动省列表，请求市和县数据，1：滑动市列表，请求县数据，其他：请求省市县数据
 @param proviceID 省ID
 @param cityID 市ID
 */
-(void)getAreaDataWithComponent:(NSInteger)component proviceID:(NSString *)proviceID andCityID:(NSString *)cityID
{
    
  //  [MBProgressHUD showHUDAddedTo:self.superview animated:YES];
    NSDictionary * body = nil;
    if (component == 0) {//滑动省的列表
       
        body = @{@"id":proviceID};
    }else if (component == 1){//滑动市的列表
        
        body = @{@"id":cityID};
    }else{
        
        body = @{@"id":@"0"};
    }
    [HttpTool POST:[AddRessList getWholeUrl] param:body success:^(id  _Nullable responseObject) {
       
        NSArray *array =responseObject[@"data"][@"info"];
        if (array.count) {
            if (component == 0) {
                [self.cityArr removeAllObjects];
                [self.cityArr addObjectsFromArray:array];
                NSString * cityID = [NSString stringWithFormat:@"%@",[[self.cityArr firstObject] objectForKey:@"id"]];
                [self.pick reloadComponent:1];
                [self.pick selectRow:0 inComponent:1 animated:YES];
                [self getAreaDataWithComponent:1 proviceID:@"" andCityID:cityID];
            }else if(component == 1){
                [self.areaArr removeAllObjects];
                [self.areaArr addObjectsFromArray:array];
                [self.pick reloadComponent:2];
                [self.pick selectRow:0 inComponent:2 animated:YES];
                
            }else{
                [self.ProvinceArr removeAllObjects];
                [self.ProvinceArr addObjectsFromArray:array];
                NSString * proviceID = [NSString stringWithFormat:@"%@",[[self.ProvinceArr firstObject] objectForKey:@"id"]];
                [self.pick reloadComponent:0];
                [self getAreaDataWithComponent:0 proviceID:proviceID andCityID:@""];
            }
        }else{
            if (component == 0) {
                [Tools showErrorWithString:@"暂无数据"];
            }else if(component == 1){
                [Tools showErrorWithString:@"暂无数据"];
            }else{
                 [Tools showErrorWithString:@"暂无数据"];
                
            }
            [self tapClick];
        }
    } error:^(NSString * _Nullable error) {
        
    }];
    
    
   
    
}
@end







