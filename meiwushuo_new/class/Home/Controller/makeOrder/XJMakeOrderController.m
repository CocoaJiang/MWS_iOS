//
//  XJMakeOrderController.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/4.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJMakeOrderController.h"
#import "XJMakeOderChoseAddressCell.h"
#import "XJOnFreeGoodsCell.h"
#import "XJOrderMessageCell.h"
#import "XJOrderPriceCell.h"
#import "XJPayView.h"
#import "XJMakePayController.h"
#import "XJAddressManagerController.h"
@interface XJMakeOrderController ()
@property(strong,nonatomic)XJPayView *payView;
@end

@implementation XJMakeOrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"确认订单";
    [self.dataSorces addObjectsFromArray:self.expArray];
    
    [self.view addSubview:self.payView];
    [self.payView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
          make.bottom.mas_equalTo(self.view.mas_bottom);
        }
        make.height.mas_equalTo(@45);
    }];
    
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.payView.mas_top);
    }];
    [self.dataSorces addObject:self.expArray];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.tableView XJRegisCellWithNibWithName:NSStringFromClass(XJMakeOderChoseAddressCell.class)];
    [self.tableView XJRegisCellWithNibWithName:NSStringFromClass(XJOnFreeGoodsCell.class)];
    [self.tableView XJRegisCellWithNibWithName:NSStringFromClass(XJOrderMessageCell.class)];
    [self.tableView XJRegisCellWithNibWithName:NSStringFromClass(XJOrderPriceCell.class)];

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0 && indexPath.row==0) {
        [[Tools retrunNAV]pushViewController:[XJAddressManagerController new] animated:YES];
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0 && indexPath.row==0) {
        XJMakeOderChoseAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(XJMakeOderChoseAddressCell.class)];
        return cell;
    }else if (indexPath.section==1){
        XJOnFreeGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(XJOnFreeGoodsCell.class)];
        cell.type = MakeORderDetail;
        return cell;
        
    }else if (indexPath.section==2 ){
        if (indexPath.row==0) {
            XJOrderMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(XJOrderMessageCell.class)];
            return cell;
        }else{
            XJOrderPriceCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(XJOrderPriceCell.class)];
            if (indexPath.row==1) {
                cell.name.text = @"商品小记";
                cell.price.text = [Tools retrunPriceWithPriceString:@"300"];
            }else{
                cell.name.text = @"运费";
                cell.price.text = [Tools retrunPriceWithPriceString:@"5"];
            }
            return cell;
        }
        
    }else{
        return nil;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else if (section==1){
        return 2;
    }else{
        return 3;
    }
}
-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 80;
    }else if (indexPath.section==1){
        return 120;
    }else if (indexPath.section==2){
        return 60;
    }else{
        return 45;
    }
 
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==2) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 25)];
        view.backgroundColor = [UIColor groupTableViewBackgroundColor];
        return view;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==2) {
        return 15;
    }else{
        return CGFLOAT_MIN;
    }
}
-(XJPayView *)payView{
    if (!_payView) {
        _payView = [Tools XJ_XibWithName:NSStringFromClass(XJPayView.class)];
        _payView.payButton.clickAction = ^(UIButton *button) {
            XJMakePayController *controller_pay = [[XJMakePayController alloc]init];
            [[Tools retrunNAV]pushViewController:controller_pay animated:YES];
        };
    }
    return _payView;
}



@end
