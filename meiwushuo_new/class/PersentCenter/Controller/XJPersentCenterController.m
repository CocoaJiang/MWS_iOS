//
//  XJPersentCenterController.m
//  meiwushuo_new
//
//  Created by pro on 2019/6/25.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJPersentCenterController.h"
#import "XJPerSonHeader.h"
#import "XJloginViewController.h"
static NSString *const IDSTRING  = @"IDSTRING";
@interface XJPersentCenterController ()
@property(strong,nonatomic)XJPerSonHeader *header;
@end

@implementation XJPersentCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    NSArray *arrayTitle = @[@"会员中心",@"我的优惠券",@"购物车",@"地址管理",@"我的收藏",@"购买记录"];
    [self.dataSorces addObjectsFromArray:arrayTitle];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 320)];
    [view addSubview:self.header];
    [self.header mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(view);
    }];
    self.tableView.tableHeaderView = view;
}
-(XJPerSonHeader *)header{
    if (!_header) {
        _header = [Tools XJ_XibWithName:@"XJPerSonHeader"];
    }
    return _header;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IDSTRING];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:IDSTRING];
    }
    cell.textLabel.text = self.dataSorces[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    XJloginViewController *loginController = [[XJloginViewController alloc]init];
    [[Tools retrunNAV]pushViewController:loginController animated:YES];
}


@end
