//
//  XJAddAddressController.m
//  iphoneLive
//
//  Created by Mac on 2019/6/6.
//  Copyright © 2019 美物说. All rights reserved.
//

#import "XJAddAddressController.h"
#import "XJInputView.h"
#import "UITextView+YLTextView.h"
#import "NSString+Categrogy.h"//
#import "QHSelsecAreaView.h"
@interface XJAddAddressController ()<UITextFieldDelegate>
@property(strong,nonatomic)XJInputView *namePutView;
@property(strong,nonatomic)XJInputView *numberPutView;
@property(strong,nonatomic)XJInputView *areaPutView;
@property(strong,nonatomic)UITextView *addressTextview;
@property(strong,nonatomic)UISwitch *isdefultSwitch;
@property(strong,nonatomic)QHSelsecAreaView *areaView;
@property(strong,nonatomic)NSString *province;
@property(strong,nonatomic)NSString  *city;
@property(strong,nonatomic)NSString *area;



@end

@implementation XJAddAddressController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    if (self.model) {
        
        self.title = @"编辑地址";
        self.namePutView.textField.text = self.model.realname;
        self.numberPutView.textField.text = self.model.mobile;
        self.addressTextview.text = self.model.street;
        self.areaPutView.textField.text = self.model.cityname;
        self.province = self.model.province;
        self.city = self.model.city;
        self.area = self.model.area;
        
    }else{
        
        self.title = @"添加新地址";
    }
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:APPMAINTEXTCOLOR forState:UIControlStateNormal];
    [button setTitle:@"保存" forState:UIControlStateNormal];
    button.size  = CGSizeMake(50, 50);
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    
    __weak typeof(self)weakSelf =self;
    button.clickAction = ^(UIButton *button) {
        [weakSelf updataAddress];
    };
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = item;
    [self creatUI];
    
    
    
}

-(void)creatUI{
  
    [self.view addSubview:self.namePutView];
    [self.namePutView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(@60);
        make.top.mas_equalTo(self.view.mas_top);
    }];
    [self.view addSubview:self.numberPutView];
    [self.numberPutView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(@60);
        make.top.mas_equalTo(self.namePutView.mas_bottom);
    }];
    [self.view addSubview:self.areaPutView];
    [self.areaPutView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(@60);
        make.top.mas_equalTo(self.numberPutView.mas_bottom);
    }];
    [self.view addSubview:self.addressTextview];
    [self.addressTextview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(10);
        make.right.mas_equalTo(self.view.mas_right).offset(-10);
        make.height.mas_equalTo(@80);
        make.top.mas_equalTo(self.areaPutView.mas_bottom).offset(20);
    }];
    UIView *line = [[UIView alloc ]init];
    line.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.addressTextview.mas_bottom);
        make.height.mas_equalTo(@16);
    }];
    
    [self.view addSubview:self.isdefultSwitch];
    [self.isdefultSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view.mas_right).offset(-20);
        make.top.mas_equalTo(line.mas_bottom).offset(20);
        
    }];
    
    UILabel *lanbl = [[UILabel alloc]init];
    lanbl.text  = @"设为默认";
    lanbl.font = [UIFont systemFontOfSize:14];
    [lanbl sizeToFit];
    lanbl.textColor = [UIColor darkTextColor];
    [self.view addSubview:lanbl];
    [lanbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.centerY.mas_equalTo(self.isdefultSwitch.mas_centerY);
    }];
    
    

}

-(XJInputView *)namePutView{
    if (!_namePutView) {
        _namePutView = [Tools XJ_XibWithName:@"XJInputView"];
        _namePutView.title.text = @"收货人：";
    }
    return _namePutView;
}
-(XJInputView *)numberPutView{
    if (!_numberPutView) {
        _numberPutView = [Tools XJ_XibWithName:@"XJInputView"];
        _numberPutView.title.text = @"手机号码：";
        _numberPutView.textField.keyboardType = UIKeyboardTypePhonePad;
    }
    return _numberPutView;
}

-(XJInputView *)areaPutView{
    if (!_areaPutView) {
        _areaPutView = [Tools XJ_XibWithName:@"XJInputView"];
        _areaPutView.title.text = @"所在地区：";
        _areaPutView.textField.delegate = self;
    }
    return _areaPutView;
}
-(UITextView *)addressTextview{
    if (!_addressTextview) {
        _addressTextview = [[UITextView alloc]init];
        if (!self.model) {
              _addressTextview.placeholder = @"请输入详细地址如道路、门牌号、小区、楼栋号、单元室等";
        }
      
    }
    return _addressTextview;
}

-(UISwitch *)isdefultSwitch{
    if (!_isdefultSwitch) {
        _isdefultSwitch = [[UISwitch alloc]init];
        [_isdefultSwitch setOnTintColor:APPMAINCOLOR];
        _isdefultSwitch.on = [self.model.isdefault integerValue];
    }
    return _isdefultSwitch;
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [self.namePutView.textField resignFirstResponder];
    [self.numberPutView.textField resignFirstResponder];
    [self.addressTextview resignFirstResponder];
    QHSelsecAreaView * areaView = [[QHSelsecAreaView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT)];
    [[UIApplication sharedApplication].keyWindow addSubview:areaView];
    
    if (self.model) {
        [areaView getAreaDataWithComponent:2 proviceID:self.model.province andCityID:self.model.cityname];
    }else{
        [areaView getAreaDataWithComponent:2 proviceID:@"" andCityID:@""];
    }

    __weak typeof(self)weakSelf = self;
    areaView.areaBlock = ^(NSString *proviceID, NSString *cityID, NSString *areaID, NSString *proviceName, NSString *cityName, NSString *areaName) {
        textField.text = [NSString stringWithFormat:@"%@%@%@",proviceName,cityName,areaName];
        weakSelf.province =proviceID;
        weakSelf.city = cityID;
        weakSelf.area = areaID;
    };
    
    areaView.hidden = NO;
    [areaView.pickView mas_updateConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(areaView.mas_bottom).offset(-230);
        } else {
            make.top.equalTo(areaView.mas_bottom).offset(-230);
        }
        make.bottom.equalTo(areaView.mas_bottom).offset(0);
    }];
    [UIView animateWithDuration:0.3 animations:^{
        [areaView layoutIfNeeded];
        areaView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
        [areaView.pickView layoutIfNeeded];
    }completion:^(BOOL finished) {
        
    }];
    
    return NO;
}


#pragma mark - 提交逻辑
-(void)updataAddress{
    

    [self.namePutView.textField resignFirstResponder];
    [self.numberPutView.textField resignFirstResponder];
    [self.areaPutView.textField resignFirstResponder];
    [self.addressTextview resignFirstResponder];
    
    if ([self.namePutView.textField.text isEmpty]) {
        [Tools showErrorWithString:@"请填写收货人"];
        return;
    }
    if ([self.numberPutView.textField.text isEmpty]) {
        
        return;
    }
    
    //地址。。。。。。
    if (self.city ==nil || self.area ==nil || self.province ==nil) {
        [Tools showErrorWithString:@"请选择地址"];
        return;
    }
    

    
    
    NSDictionary *dict  = @{
                                @"uid":[Config getOwnID],
                                @"token":[Config getOwnToken],
                                @"realname":self.namePutView.textField.text,
                                @"mobile":self.numberPutView.textField.text,
                                @"address":self.addressTextview.text,
                                @"is_default":self.isdefultSwitch.on?@"1":@"0",
                                @"province_id":self.province,
                                @"city_id":self.city,
                                @"county_id":self.area,
                                };
    

    NSMutableDictionary *parmart = [[NSMutableDictionary alloc]init];
    [parmart addEntriesFromDictionary:dict];
    if (self.model) {
       [ parmart setObject:self.model.id forKey:@"id"];
    }
    [HttpTool POST:[PostMyAddress getWholeUrl] param:parmart success:^(id  _Nullable responseObject) {
        if (self.refush) {
            self.refush();
        }
        NSString *info = [[responseObject objectForKey:@"data"] objectForKey:@"msg"];
        [Tools showSuccessWithString:info];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[Tools retrunNAV]popViewControllerAnimated:YES];
        });
    } error:^(NSString * _Nullable error) {
        
    }];
    
    
   
}

@end
