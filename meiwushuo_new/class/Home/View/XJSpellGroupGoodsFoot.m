//
//  XJSpellGroupGoodsFoot.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/4.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJSpellGroupGoodsFoot.h"

@implementation XJSpellGroupGoodsFoot

- (void)awakeFromNib {
    [super awakeFromNib];
    self.title.font= [UIFont systemFontOfSize:13];
    self.title.textColor = KTEXTGRAYCOLOR;
    self.addTeamButton.titleLabel.font =
    self.openTeam.titleLabel.font = [UIFont systemFontOfSize:15];
    self.openTeam.backgroundColor = RGBA(238, 9, 9, 1);
}

@end
