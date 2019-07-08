//
//  XJAddSpellGroupTeamReusableView.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/8.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJAddSpellGroupTeamReusableView.h"

@implementation XJAddSpellGroupTeamReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.title.textColor  = KTEXTCOLOR;
    self.title.font = [UIFont boldSystemFontOfSize:16];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:@"仅剩" attributes:@{
                                                                                                            NSFontAttributeName:[UIFont systemFontOfSize:13],
                                                                                                            NSForegroundColorAttributeName:KTEXTGRAYCOLOR
                                                                            }];
    [string appendAttributedString:[Tools ReturnFontWithString:@"1" andWithColor:KREDCOKOR andWithFont:[UIFont fontWithName:DINAFONT size:16] andWithString:@"个名额，15:32:39后结束" andWithColor:KTEXTGRAYCOLOR andWithFont:[UIFont systemFontOfSize:13]]];
    self.disLabel.attributedText = string;
    
}

@end
