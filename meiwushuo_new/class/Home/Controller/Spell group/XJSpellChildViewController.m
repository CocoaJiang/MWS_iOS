//
//  XJSpellChildViewController.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/3.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJSpellChildViewController.h"
#import "XJOnFreeGoodsCell.h"
#import "XJSpellGroupDetail.h"
#import "XJSpellGroupDetail.h"
@interface XJSpellChildViewController ()
@property (nonatomic, copy) void(^scrollCallback)(UIScrollView *scrollView);

@end

@implementation XJSpellChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.dataSorces addObjectsFromArray:self.expArray];
    [self.view addSubview:self.tableView];
    [self.tableView XJRegisCellWithNibWithName:NSStringFromClass(XJOnFreeGoodsCell.class)];
    self.tableView.rowHeight = 140;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XJOnFreeGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([XJOnFreeGoodsCell class])];
    cell.type = 1;
    return cell;
}
//进入详情的入口
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[Tools retrunNAV]pushViewController:[XJSpellGroupDetail new] animated:YES];
}

-(void)viewDidLayoutSubviews{
    self.tableView.frame  = self.view.bounds;
}

- (UIView *)listView {
    return self.view;
}


- (UIScrollView *)listScrollView {
    return self.tableView;
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView *))callback {
    self.scrollCallback = callback;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.scrollCallback(scrollView);
}

@end
