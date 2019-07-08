//
//  XJSpecificationsPOPController.m
//  meiwushuo_new
//
//  Created by pro on 2019/7/8.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import "XJSpecificationsPOPController.h"
#import <HWPanModal/HWPanModal.h>
#import "XJSpecificationCell.h"


@interface XJSpecificationsPOPController () <HWPanModalPresentable>

@end

@implementation XJSpecificationsPOPController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.dataSorces addObjectsFromArray:self.expArray];
     [self.dataSorces addObjectsFromArray:self.expArray];
     [self.dataSorces addObjectsFromArray:self.expArray];
     [self.dataSorces addObjectsFromArray:self.expArray];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    UILabel *label = [[UILabel alloc]init];
    label.font  = [UIFont boldSystemFontOfSize:15];
    label.text = @"产品参数";
    [label sizeToFit];
    [view addSubview:label];
    label.center = view.center;
    self.tableView.tableHeaderView = view;
    [self.tableView XJRegisCellWithNibWithName:NSStringFromClass(XJSpecificationCell.class)];
    
}

#pragma mark - cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XJSpecificationCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(XJSpecificationCell.class)];
    return cell;
    
}

#pragma mark - HWPanModalPresentable

- (PanModalHeight)longFormHeight {
    return PanModalHeightMake(PanModalHeightTypeMax, 100);
}

- (PanModalHeight)shortFormHeight {
    return PanModalHeightMake(PanModalHeightTypeMaxTopInset, 200);
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


#pragma mark -


@end
