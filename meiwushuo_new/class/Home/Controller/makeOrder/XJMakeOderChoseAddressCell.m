//
//  XJMakeOderChoseAddressCell.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/4.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJMakeOderChoseAddressCell.h"

@implementation XJMakeOderChoseAddressCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.addressLabel.numberOfLines = 0;
    self.addressLabel.attributedText = [Tools ReturnFontWithString:@"张小江     18039688559" andWithColor:KTEXTCOLOR andWithFont:[UIFont boldSystemFontOfSize:15] andWithString:@"\n\n河南省南阳市新野县官司村" andWithColor:KTEXTGRAYCOLOR andWithFont:[UIFont systemFontOfSize:13]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
