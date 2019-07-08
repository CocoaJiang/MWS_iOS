//
//  XJInputPhoneAndPassWordView.h
//  meiwushuo_new
//
//  Created by pro on 2019/7/5.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,InputType){
    
    XJLOGIN=0,
    XJREGISACCTONT=1,
    
};

NS_ASSUME_NONNULL_BEGIN
@interface XJInputPhoneAndPassWordView : UIView
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textfield;
@property(assign,nonatomic)InputType type;

@end

NS_ASSUME_NONNULL_END
