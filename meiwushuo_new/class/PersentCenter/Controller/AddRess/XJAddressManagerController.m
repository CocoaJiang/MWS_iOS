//
//  XJAddressManagerController.m
//  iphoneLive
//
//  Created by Mac on 2019/6/5.
//  Copyright © 2019 美物说. All rights reserved.
//

#import "XJAddressManagerController.h"
#import "XJaddRessManager.h"
#import "XJAddressManagerCell.h"
#import "UITableView+ZXJTableviewCategory.h"
#import "XJAddAddressController.h"
static NSString * const cellIDSTRING = @"cellID";
@interface XJAddressManagerController ()<UITableViewDelegate,UITableViewDataSource>
@property(assign,nonatomic)NSInteger page;
@property(strong,nonatomic)NSMutableArray *array;
@end

@implementation XJAddressManagerController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    self.title = @"地址管理";
    [self.view addSubview:self.tableView];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    [self getMessage];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:APPMAINTEXTCOLOR forState:UIControlStateNormal];
    [button setTitle:@"添加" forState:UIControlStateNormal];
    button.size  = CGSizeMake(50, 50);
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    __weak typeof(self)weakSelf =self;
    XJAddAddressController *controller = [[XJAddAddressController alloc]init];
    controller.refush = ^{
        [self.array removeAllObjects];
        [self getMessage];
    };
    button.clickAction = ^(UIButton *button) {
        [weakSelf.navigationController pushViewController:controller animated:YES];
    };
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = item;
    
    
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XJAddressManagerCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIDSTRING];
    if (!cell) {
        cell = [[XJAddressManagerCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIDSTRING];
    }
    cell.model = self.array[indexPath.row];
    __weak typeof(self)weakSelf = self;
    cell.chosedefultAddressBlock = ^(XJaddRessManager * _Nonnull model) {
        for (XJaddRessManager *model in weakSelf.array) {
            model.isdefault = @"0";
        }
        model.isdefault=@"1";
        [self.tableView reloadData];
        [weakSelf changeAddressDefultWithModel:model];
    };
    //编辑地址
    cell.editAddress = ^(XJaddRessManager * _Nonnull model) {
      
        XJAddAddressController *controller = [[XJAddAddressController alloc]init];
        
        controller.refush = ^{
          
            [weakSelf.array removeAllObjects];
            
            [weakSelf getMessage];
            
        };
        
        controller.model = model;
        
        [weakSelf.navigationController pushViewController:controller animated:YES];

    };
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.array count];
}
-(void)getMessage{
    

    
}

-(NSMutableArray *)array{
    if (!_array) {
        _array = [[NSMutableArray alloc]init];
    }
    return _array;
}


-(void)changeAddressDefultWithModel:(XJaddRessManager *)model{
    NSDictionary *dict  = @{
                            @"uid":[Config getOwnID],
                            @"token":[Config getOwnToken],
                            @"realname":model.realname,
                            @"mobile":model.mobile,
                            @"address":model.street,
                            @"is_default":@"1",
                            @"province_id":model.province,
                            @"city_id":model.city,
                            @"county_id":model.area,
                            @"id":model.id
                            };
    [HttpTool POST:[PostMyAddress getWholeUrl] param:dict success:^(id  _Nullable responseObject) {
        
    } error:^(NSString * _Nullable error) {
        
    }];
    
   

}



#pragma 侧滑删除
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.type==addressManager?YES:NO;
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"您是否要删除此地址?" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *delete = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
            XJaddRessManager *model = self.array[indexPath.row];
            
            [self deleteAddressWithModel:model];
            
      
        
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:delete];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

-(void)deleteAddressWithModel:(XJaddRessManager *)model{
    NSDictionary *dict = @{
                           @"uid":[Config getOwnID],
                           @"token":[Config getOwnToken],
                           @"id":model.id,
                           };
    
    [HttpTool POST:[DelAddress getWholeUrl] param:dict success:^(id  _Nullable responseObject) {
        [self.array removeAllObjects];
        [self getMessage];
        [Tools showSuccessWithString:[responseObject objectForKey:@"msg"]];
    } error:^(NSString * _Nullable error) {
        
    }];
    
    
  
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.type==addressManager) {
        return;
    }else{
        if (self.choseAddress) {
            self.choseAddress(self.array[indexPath.row]);
        }
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
