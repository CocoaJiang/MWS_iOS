//
//  XJloginViewController.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/5.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJloginViewController.h"
#import "XJInputPhoneAndPassWordView.h"
#import "XJloginbootonView.h"
#import "XJRegisViewController.h"
@interface XJloginViewController ()
@property(strong,nonatomic)XJInputPhoneAndPassWordView *account;
@property(strong,nonatomic)XJInputPhoneAndPassWordView *passWord;
@property(strong,nonatomic)XJloginbootonView *bootomView;
@end

@implementation XJloginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"beijing_login"]];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(SCREENH_HEIGHT/5*2);
    }];
    [self.view addSubview:self.account];
    [self.account mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(28);
        make.right.mas_equalTo(self.view.mas_right).offset(-28);
        make.top.mas_equalTo(imageView.mas_bottom).offset(10);
        make.height.mas_equalTo(@45);
    }];
    
    [self.view addSubview:self.passWord];
    [self.passWord mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(28);
        make.right.mas_equalTo(self.view.mas_right).offset(-28);
        make.top.mas_equalTo(self.account.mas_bottom).offset(20);
        make.height.mas_equalTo(@45);
    }];
    
    [self.view addSubview:self.bootomView];
    [self.bootomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.passWord.mas_bottom).offset(30);
        make.height.mas_equalTo(@240);
    }];
    
}
-(XJInputPhoneAndPassWordView *)account{
    if (!_account) {
        _account = [Tools XJ_XibWithName:NSStringFromClass(XJInputPhoneAndPassWordView.class)];
        _account.textfield.placeholder = @"请输入您的账号";
        _account.textfield.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _account;
}
-(XJInputPhoneAndPassWordView *)passWord{
    if (!_passWord) {
        _passWord =[Tools XJ_XibWithName:NSStringFromClass(XJInputPhoneAndPassWordView.class)];
        _passWord.label.text = @"密码";
        _passWord.textfield.placeholder = @"请输入您的密码";
        _passWord.textfield.secureTextEntry = YES;
    }
    return _passWord;
}
-(XJloginbootonView *)bootomView{
    if (!_bootomView) {
        _bootomView = [Tools XJ_XibWithName:NSStringFromClass(XJloginbootonView.class)];
        _bootomView.regisButton.clickAction = ^(UIButton *button) {
            [[Tools retrunNAV]pushViewController:[XJRegisViewController new] animated:YES];
        };
        _bootomView.backPassword.clickAction = ^(UIButton *button) {
            XJRegisViewController *controller = [[XJRegisViewController alloc]init];
            controller.type = XJFORGET;
            [[Tools retrunNAV]pushViewController:controller animated:YES];
        };
    }
    return _bootomView;
}

@end
