//
//  XJSpellGroupSuccessController.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/4.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJSpellGroupSuccessController.h"
#import "XJSpellGropuHeaderGoods.h"////今天就用一次看看是不是那个效果。。。。。
#import "XJSpellGroupPresonCell.h"//////这个是那个人数。。。
#import "XJSpellGropuPeronListHeader.h" //头部的那个文件。。。。
#import "XJSpellGroupPersonList.h"///cell 文件。
@interface XJSpellGroupSuccessController ()
@property(strong,nonatomic)XJSpellGropuHeaderGoods *headerView;
@end

@implementation XJSpellGroupSuccessController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title  = @"拼团详情";
    [self.dataSorces addObjectsFromArray:self.expArray];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    [view addSubview:self.headerView];
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(view);
    }];
    self.tableView.tableHeaderView = view;
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.tableView XJRegisHeaderOrFooterforNibWithName:NSStringFromClass(XJSpellGropuPeronListHeader.class)];
    [self.tableView XJRegisCellWithNibWithName:NSStringFromClass(XJSpellGroupPersonList.class)];
 }

-(XJSpellGropuHeaderGoods *)headerView{
    if (!_headerView) {
        _headerView = [Tools XJ_XibWithName:NSStringFromClass(XJSpellGropuHeaderGoods.class)];
        _headerView.userInteractionEnabled = YES;
        [_headerView setactiveIngWithString:@"团购进行中"];
        UITapGestureRecognizer *zer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(back)];
        [_headerView addGestureRecognizer:zer];
    }
    return _headerView;
}
-(void)back{
    XJNavigationController *nav = [[UIApplication sharedApplication]visibleNavigationController];
    int index = (int)[[nav viewControllers]indexOfObject:self];
    [nav popToViewController:[nav.viewControllers objectAtIndex:(index -2)] animated:YES];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0 && indexPath.row==0) {
        XJSpellGroupPresonCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(XJSpellGroupPresonCell.class)];
        if (!cell) {
            cell = [[XJSpellGroupPresonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(XJSpellGroupPresonCell.class)];
        }
        return cell;
       
    }
     XJSpellGroupPersonList *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(XJSpellGroupPersonList.class)];
    cell.label.hidden = indexPath.row==0?NO:YES;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else{
        return 3;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 200;
    }else{
        return 60;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==1) {
        XJSpellGropuPeronListHeader *headr = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass(XJSpellGropuPeronListHeader.class)];
        return headr;
    }else{
        return nil;
    }
  
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self==0) {
        return CGFLOAT_MIN;
    }else{
        return 40;
    }
}


@end
