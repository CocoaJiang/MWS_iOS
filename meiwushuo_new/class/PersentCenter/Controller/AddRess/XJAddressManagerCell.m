//
//  XJAddressManagerCell.m
//  iphoneLive
//
//  Created by Mac on 2019/6/5.
//  Copyright © 2019 美物说. All rights reserved.
//

#import "XJAddressManagerCell.h"
#import "UIButton+button_Rect.h"
#import "XJaddRessManager.h"
#import "Tools.h"
@interface XJAddressManagerCell ()
@property(strong,nonatomic)UIButton *delButton;
@property(strong,nonatomic)UIView *lineView;
@property(strong,nonatomic)UIButton *choseButton;
@property(strong,nonatomic)UILabel *nameAndIphoneLabel;
@property(strong,nonatomic)UILabel *addRessLabel;
@end
@implementation XJAddressManagerCell
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self.contentView addSubview:self.choseButton];
        [self.choseButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.left.mas_equalTo(self.contentView.mas_left).offset(10);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        [self.contentView addSubview:self.nameAndIphoneLabel];
        [self.nameAndIphoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.choseButton.mas_right).offset(10);
            make.top.mas_equalTo(self.contentView.mas_top).offset(10);
            make.height.mas_equalTo(@30);
        }];

        [self.contentView addSubview:self.delButton];
        [self.delButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        [self.contentView addSubview:self.lineView];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(0.7, 40));
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.right.mas_equalTo(self.delButton.mas_left).offset(-10);
        }];
        [self.contentView addSubview:self.addRessLabel];
        [self.addRessLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.nameAndIphoneLabel.mas_left);
            make.top.mas_equalTo(self.nameAndIphoneLabel.mas_bottom).offset(5);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-5);
            make.right.mas_equalTo(self.lineView.mas_left).offset(-5);
        }];
        UIView *lineView = [[UIView alloc]init];
        lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.contentView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(self.contentView);
            make.height.mas_equalTo(@0.5);
        }];
        
    }
    return self;
}
#pragma mark - 懒加载部分。。。。。
-(UIButton *)delButton{
    if (!_delButton) {
        _delButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_delButton setTitleColor:APPMAINTEXTCOLOR forState:UIControlStateNormal];
        [_delButton setTitle:@"编辑" forState:UIControlStateNormal];
        _delButton.titleLabel.font = [UIFont systemFontOfSize:12];
        __weak typeof(self)weakSelf = self;
        _delButton.clickAction = ^(UIButton *button) {
            if (weakSelf.editAddress) {
                weakSelf.editAddress(weakSelf.model);
            }
        };
    }
    return _delButton;
}
-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _lineView;
}
-(UIButton *)choseButton{
    if (!_choseButton) {
        _choseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_choseButton setImage:[UIImage imageNamed:@"weixuanzhong"] forState:UIControlStateNormal];
        [_choseButton setImage:[UIImage imageNamed:@"xuanzhong"] forState:UIControlStateSelected];
        [_choseButton sizeToFit];
        __weak typeof(self)weakSelf = self;
        _choseButton.clickAction = ^(UIButton *button) {
            if (button.selected) {
                return ;
            }
            button.selected = !button.selected;
            if (weakSelf.chosedefultAddressBlock ) {
                weakSelf.chosedefultAddressBlock(weakSelf.model);
            }
        };
    }
    return _choseButton;
}

-(UILabel *)nameAndIphoneLabel{
    if (!_nameAndIphoneLabel) {
        _nameAndIphoneLabel = [[UILabel alloc]init];
        [_nameAndIphoneLabel sizeToFit];
    }
    return _nameAndIphoneLabel;
}
-(UILabel *)addRessLabel{
    if (!_addRessLabel) {
        _addRessLabel = [[UILabel alloc]init];
        _addRessLabel.font = [UIFont systemFontOfSize:14];
        _addRessLabel.textColor = [UIColor darkTextColor];
        _addRessLabel.numberOfLines=0;
    }
    return _addRessLabel;
}

-(void)setModel:(XJaddRessManager *)model{
    _model = model;
    _choseButton.selected = [model.isdefault boolValue];
    _nameAndIphoneLabel.attributedText =[Tools ReturnWithString:[NSString stringWithFormat:@"%@    ",model.realname] andWithColor:[UIColor darkTextColor] andWithFont:16 andWithString:model.mobile andWithColor:[UIColor darkTextColor] andWithFont:13];
    NSString *string = [NSString stringWithFormat:@"%@",model.address];
    if ([model.isdefault boolValue]) {
        
        NSMutableAttributedString * firstPart = [[NSMutableAttributedString alloc] initWithString:@"  默认  "];
        NSDictionary *firstAttributes = @{
                                          NSForegroundColorAttributeName:RGBA(252, 77, 252,1),
                                          NSFontAttributeName:[UIFont systemFontOfSize:12],
                                          NSBackgroundColorAttributeName:RGBA(255, 214, 255,1)
                                          };
        [firstPart setAttributes:firstAttributes range:NSMakeRange(0,firstPart.length)];
        NSMutableAttributedString * secend = [[NSMutableAttributedString alloc] initWithString:string];
        NSDictionary * sendAuuributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor darkTextColor]};
        [secend setAttributes:sendAuuributes range:NSMakeRange(0,secend.length)];
        [firstPart appendAttributedString:secend];
        _addRessLabel.attributedText =firstPart;
        
    }else{
        _addRessLabel.text = string;
    }

}



@end
