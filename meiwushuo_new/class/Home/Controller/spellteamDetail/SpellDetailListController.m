//
//  SpellDetailListController.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/6.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "SpellDetailListController.h"
#import "XJSpellTeamDetailCell.h"
@interface SpellDetailListController ()

@end

@implementation SpellDetailListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.dataSorces addObjectsFromArray:self.expArray];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    [self.tableView XJRegisCellWithNibWithName:NSStringFromClass(XJSpellTeamDetailCell.class)];
    self.tableView.rowHeight=150;
}

//....
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XJSpellTeamDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(XJSpellTeamDetailCell.class)];
    return cell;
}





-(UIView *)listView{
    return self.view;
}
- (UIScrollView *)listScrollView{
    return self.tableView;
}

@end
