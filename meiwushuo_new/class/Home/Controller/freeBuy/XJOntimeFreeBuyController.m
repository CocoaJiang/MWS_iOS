//
//  XJOntimeFreeBuyController.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/2.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJOntimeFreeBuyController.h"
#import "XJOnFreeBuyTableHeaderView.h"
#import "XJOnFreeGoodsCell.h"
static NSString *const  IDSTRING_CELL = @"XJOnFreeGoodsCell";
@interface XJOntimeFreeBuyController ()
@property(strong,nonatomic)XJOnFreeBuyTableHeaderView *headerView;
@end

@implementation XJOntimeFreeBuyController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNAV];
    [self.dataSorces addObjectsFromArray:self.expArray];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    self.tableView.rowHeight = 140;
    [self.tableView XJRegisCellWithNibWithName:IDSTRING_CELL];
    self.tableView.tableHeaderView = self.headerView;
}
-(void)setNAV{
    self.title = @"限时折扣";
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"sousuo"] forState:UIControlStateNormal];
    button.size = CGSizeMake(50, 50);
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = item;
}

-(XJOnFreeBuyTableHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[XJOnFreeBuyTableHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/20*9+50+50)];
    }
    return _headerView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XJOnFreeGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:IDSTRING_CELL];
    return cell;
}







@end
