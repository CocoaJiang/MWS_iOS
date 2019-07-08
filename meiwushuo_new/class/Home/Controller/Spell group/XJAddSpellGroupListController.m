//
//  XJAddSpellGroupListController.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/8.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJAddSpellGroupListController.h"
#import "XJlookmoreSpellGroupListcell.h"
@interface XJAddSpellGroupListController ()<HWPanModalPresentable>

@end

@implementation XJAddSpellGroupListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.dataSorces addObjectsFromArray:self.expArray];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    UILabel *label = [[UILabel alloc]init];
    label.font  = [UIFont boldSystemFontOfSize:15];
    label.text = @"正在拼团";
    [label sizeToFit];
    [view addSubview:label];
    label.center = view.center;
    self.tableView.tableHeaderView = view;
    [self.tableView XJRegisCellWithNibWithName:NSStringFromClass(XJlookmoreSpellGroupListcell.class)];
    self.tableView.rowHeight=65;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XJlookmoreSpellGroupListcell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(XJlookmoreSpellGroupListcell.class)];
    return cell;
}


#pragma mark - HWPanModalPresentable

- (PanModalHeight)longFormHeight {
    return PanModalHeightMake(PanModalHeightTypeContent, 500);
}



- (UIScrollView *)panScrollable {
    return self.tableView;
}

- (BOOL)anchorModalToLongForm {
    return YES;
}
- (CGFloat)cornerRadius{
    return 20;
}


- (BOOL)showDragIndicator {
    return YES;
}


@end
