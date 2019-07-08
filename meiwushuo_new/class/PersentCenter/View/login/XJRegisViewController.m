//
//  XJRegisViewController.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/5.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJRegisViewController.h"
#import "XJInputPhoneAndPassWordView.h"
@interface XJRegisViewController ()
@property(strong,nonatomic)XJInputPhoneAndPassWordView *account;
@property(strong,nonatomic)XJInputPhoneAndPassWordView *verCode;
@property(strong,nonatomic)XJInputPhoneAndPassWordView *passWord;
@property(strong,nonatomic)XJInputPhoneAndPassWordView *makePassWord;
@property(strong,nonatomic)XJInputPhoneAndPassWordView *upMan;
@property(strong,nonatomic)UIButton *regisButton;
@property(strong,nonatomic)UIButton *sendVerCodeButton;
@property(assign,nonatomic)BOOL isNotChange;
@end

@implementation XJRegisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.type==0?@"注册":@"找回密码";
    NSArray *inputArray = @[self.account,self.verCode,self.passWord,self.makePassWord,self.upMan];
    UIView *view_b = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,self.type==0?250:210)];
    [self.view addSubview:view_b];
    NSArray *array = @[@"手机号",@"验证码",@"密码",@"确认密码",@"上级手机号"];
    if (self.type==1) {
        array  = @[@"手机号",@"验证码",@"密码",@"确认密码"];
        inputArray = @[self.account,self.verCode,self.passWord,self.makePassWord];
    }
    int i = 0;
    for (XJInputPhoneAndPassWordView *input in inputArray) {
        input.type=1;
        input.label.text = array[i];
        input.textfield.placeholder = [NSString stringWithFormat:@"请输入%@",array[i]];
        [view_b addSubview:input];
        i++;
    }
    [inputArray mas_distributeViewsAlongAxis:1 withFixedSpacing:10 leadSpacing:10 tailSpacing:0];
    [inputArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view_b).mas_offset(0);
        make.right.mas_equalTo(view_b).mas_offset(-10);
    }];
    self.sendVerCodeButton.titleLabel.font = [UIFont systemFontOfSize:13];
    self.regisButton.titleLabel.font = [UIFont systemFontOfSize:16];
    //把发送验证码安装上去。。。。。
    [self.verCode addSubview:self.sendVerCodeButton];
    [self.sendVerCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.verCode.mas_centerY);
        make.right.mas_equalTo(self.verCode.mas_right).offset(-10);
        make.size.mas_equalTo(CGSizeMake(90, 30));
    }];
    ///把立即注册撞上去。。。
    [self.view addSubview:self.regisButton];
    [self.regisButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(50);
        make.right.mas_equalTo(self.view).offset(-50);
        make.top.mas_equalTo(view_b.mas_bottom).offset(60);
        make.height.mas_equalTo(@40);
    }];
    
    ///简单的做监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ChangeBtnBackground) name:UITextFieldTextDidChangeNotification object:nil];
}
-(void)ChangeBtnBackground{
    
    //发送验证码的逻辑
    
    if (self.isNotChange) {
        if (self.account.textfield.text.length == 11) {
            _sendVerCodeButton.userInteractionEnabled = YES;
            _sendVerCodeButton.alpha=1;
        }else{
            _sendVerCodeButton.userInteractionEnabled = NO;
            _sendVerCodeButton.alpha=0.2;
        }
        
        
    }
    
  
    
    if (self.account.textfield.text.length == 11 && _verCode.textfield.text.length == 6 && _passWord.textfield.text.length > 0 && _makePassWord.textfield.text.length >0)
    {
        _regisButton.userInteractionEnabled = YES;
        _regisButton.alpha = 1;
    }
    else
    {
        _regisButton.userInteractionEnabled = NO;
        _regisButton.alpha = 0.2;
        
    }
}
-(XJInputPhoneAndPassWordView *)account{
    if (!_account) {
        _account = [Tools XJ_XibWithName:NSStringFromClass(XJInputPhoneAndPassWordView.class)];
        _account.textfield.keyboardType = UIKeyboardTypePhonePad;

    }
    return _account;
}
-(XJInputPhoneAndPassWordView *)verCode{
    if (!_verCode) {
        _verCode = [Tools XJ_XibWithName:NSStringFromClass(XJInputPhoneAndPassWordView.class)];
        _verCode.textfield.keyboardType = UIKeyboardTypePhonePad;

    }
    return _verCode;
}
-(XJInputPhoneAndPassWordView *)passWord{
    if (!_passWord) {
        _passWord = [Tools XJ_XibWithName:NSStringFromClass(XJInputPhoneAndPassWordView.class)];
        _passWord.textfield.secureTextEntry=YES;
    }
    return _passWord;
}
-(XJInputPhoneAndPassWordView *)makePassWord{
    if (!_makePassWord) {
        _makePassWord = [Tools XJ_XibWithName:NSStringFromClass(XJInputPhoneAndPassWordView.class)];
        _makePassWord.textfield.secureTextEntry = YES;
    }
    return _makePassWord;
}
-(XJInputPhoneAndPassWordView *)upMan{
    if (!_upMan) {
        _upMan = [Tools XJ_XibWithName:NSStringFromClass(XJInputPhoneAndPassWordView.class)];
        _upMan.textfield.keyboardType = UIKeyboardTypePhonePad;
    }
    return _upMan;
}
-(UIButton *)sendVerCodeButton{
    if (!_sendVerCodeButton) {
        _sendVerCodeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sendVerCodeButton setBackgroundColor:KREDCOKOR];
        [_sendVerCodeButton setTitle:@"发送验证码" forState:UIControlStateNormal];
        [_sendVerCodeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];\
        _sendVerCodeButton.layer.cornerRadius = 15;
        _sendVerCodeButton.layer.masksToBounds = YES;
        _sendVerCodeButton.alpha=0.2;
        _sendVerCodeButton.userInteractionEnabled=NO;
        __weak typeof(self)weakSelf = self;
        _sendVerCodeButton.clickAction = ^(UIButton *button) {
            [weakSelf sendCode];
        };
    }
    return _sendVerCodeButton;
}
-(UIButton *)regisButton{
    if (!_regisButton) {
        _regisButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_regisButton setBackgroundColor:KREDCOKOR];
        [_regisButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_regisButton setTitle:@"立即注册" forState:UIControlStateNormal];
        _regisButton.layer.cornerRadius = 20;
        _regisButton.layer.masksToBounds = YES;
        _regisButton.alpha=0.2;
        _regisButton.userInteractionEnabled=NO;
    
    }
    return _regisButton;
}



#pragma mark - 发送验证码。。。
-(void)sendCode{
    [HttpTool POST:[Getsmscode getWholeUrl] param:@{@"mobile":self.account.textfield.text,@"action":self.type==0?@"sms_reg":@"sms_forget"} success:^(id  _Nullable responseObject) {
        [self.sendVerCodeButton startCountDown];
    } error:^(NSString * _Nullable error) {
        
    }];
    
    
}




@end
