//
//  XJBaseViewController.h
//  meiwushuo_new
//
//  Created by pro on 2019/6/25.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^OKblock)(void);
@interface XJBaseViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)NSMutableArray *dataSorces;
@property(strong,nonatomic)UICollectionView *collectionView;
@property(assign,nonatomic)NSInteger SYindex;//当前页数
@property(assign,nonatomic)NSInteger SYall;//总页数
@property(assign,nonatomic)BOOL isHaveNextPage;//分页
////调试数据。/。。。
@property(strong,nonatomic)NSArray *expArray;
-(void)showAlrertWithTitle:(NSString *)title
            andWithMessage:(NSString *)message
  andWithCancelButtonTitle:(NSString *)Canceltitle
      andWithOKButtonTitle:(NSString *)OKbuttonTitle
            andWithOKBlock:(OKblock)okBlock;
-(void)reload;

@end

NS_ASSUME_NONNULL_END
