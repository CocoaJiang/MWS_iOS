//
//  XJMakePayController.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/6.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJMakePayController.h"
#import "XJOrderPriceCell.h"
#import "XJTeamDetailController.h"
@interface XJMakePayController ()
@end
@implementation XJMakePayController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"收银台";
    UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"全部订单" forState:UIControlStateNormal];
    [button setTitleColor:KTEXTGRAYCOLOR forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    button.size  = CGSizeMake(70, 50);
    button.clickAction = ^(UIButton *button) {
        [[Tools retrunNAV]pushViewController:[XJTeamDetailController new] animated:YES];
    };
    UIBarButtonItem *item  = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = item;
    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = KBGCOLOR;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    [self.tableView XJRegisCellWithNibWithName:NSStringFromClass(XJOrderPriceCell.class)];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
    }else{
        return 3;
    }
}
////标题那个。。。。
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==1) {
        return [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 15)];
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section==1?15:CGFLOAT_MIN;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==1) {
        return 50;
    }else{
        return 45;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        NSArray *arrayName = @[@"商品小计",@"运费"];
        NSArray *priceArray = @[[Tools retrunPriceWithPriceString:@"300"],[Tools retrunPriceWithPriceString:@"45"]];
        XJOrderPriceCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(XJOrderPriceCell.class)];
        cell.name.text = arrayName[indexPath.row];
        cell.price.text = priceArray[indexPath.row];
        return cell;
    }else{
        NSArray *Titlearray = @[@"微信支付",@"支付宝",@"余额支付"];
        NSArray *SubTitArray = @[@"微信安全支付",@"支付宝账户",@"当前余额：￥13125"];
        NSArray *imageArray = @[@"weixin_pay",@"zhifubao_pay",@"yuer_pay"];
        XJtableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(UITableViewCell.class)];
        if (!cell) {
            cell = [[XJtableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:NSStringFromClass(UITableViewCell.class)];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.textColor = KTEXTCOLOR;
            cell.detailTextLabel.textColor = KTEXTGRAYCOLOR;
            cell.textLabel.font = [UIFont systemFontOfSize:16];
            cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
        }
        cell.imageView.image = [UIImage imageNamed:imageArray[indexPath.row]];
        cell.textLabel.text = Titlearray[indexPath.row];
        cell.detailTextLabel.text =SubTitArray[indexPath.row];
        return cell;
    }
}
@end
