
//
//  Tools.h
//  IntelligentFire
//
//  Created by Andy on 2018/8/19.
//  Copyright © 2018年 SMXK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SYGifFoot.h"
#import "SYGifHeader.h"
#import "XJNavigationController.h"
typedef void(^ImageBlock)(UIImage *image,NSURL *imageUrl);
typedef void(^MoreImageBlock)(NSArray *images);
typedef void(^MoreAttestBlock)(NSArray *attesArray);
typedef void(^ItemAction)(NSUInteger itemIndex);
typedef void(^Doanything)(void);
@interface Tools : NSObject
////选择照片
+(void)XJ_morePickerController:(UIViewController *)controller image:(MoreImageBlock)block :(NSInteger)maxCount andSeletedArray:(NSMutableArray *)seltedArray andWithAttesBlock:(MoreAttestBlock)attsBlock;
///定位当前控制器
+ (UIViewController *)viewController:(UIView *)view;
///加载XIB文件
+(id)XJ_XibWithName:(NSString *)xibName;
///展示空数据页面
+(UIImage *)EmptyImage;
///加载
+(void)showLoadStatusWithString:(NSString*)string;
///状态
+(void)showStatusWithString:(NSString*)string;
///成功
+(void)showSuccessWithString:(NSString *)scuess;
///隐藏
+(void)hideView;
////加载
+(void)ShowLoading;
///失败
+(void)showErrorWithString:(NSString*)errorString;
////配合空数据页面。。。
+(NSAttributedString *)returnWithString:(NSString *)string;
/*手机号隐藏*/
+(NSString *)returnBankCard:(NSString *)BankCardStr;
/*属性字符串双*/
+(NSAttributedString *)ReturnWithString:(NSString *)stringOne
                           andWithColor:(UIColor *)colorOne
                            andWithFont:(CGFloat)fontOne
                          andWithString:(NSString *)stringTwo
                           andWithColor:(UIColor *)colorTwo
                            andWithFont:(CGFloat)fontTwo;
/*单角切圆*/
/*字体*/
+(NSAttributedString *)ReturnFontWithString:(NSString *)stringOne
                               andWithColor:(UIColor *)colorOne
                                andWithFont:(UIFont *)fontOne
                              andWithString:(NSString *)stringTwo
                               andWithColor:(UIColor *)colorTwo
                                andWithFont:(UIFont *)fontTwo;

+(void)setMaskTo:(UIView*)view
byRoundingCorners:(UIRectCorner)corners
    andWithCGSize:(CGSize )size;
/*计算字体大小传入字体*/
+(CGSize)XJCalculateTheSizeWithFont:(UIFont *)font andWithText:(NSString *)text andWithWidthMAX:(CGFloat)masW;
+(NSString *)retrunPriceWithPriceString:(NSString *)stringPrice;
+(NSString*)getCurrentTimes;
///写入文件
+(void)writeWithTokenWithString:(NSString *)string;
///读取token
+(NSString*)readToken;
///判断是否登录
//+(BOOL)isNeedLogin;
///判断是不是第一次安装
//+(BOOL)IsFirst;
//成功回调
+(void)showSuccess:(NSString *)success andWithDoEveryThingWithBlock:(Doanything)doEverything;
///失败的回调
+(void)showError:(NSString *)error andWithDoEveryThingWithBlock:(Doanything)doEverything;
//保存图片.....
+(void)saveImaheWihtImage:(UIImage *)image;
//制造一根线。
+(UIView *)retunLineView;
//获取设备的统一ID及UUID
+(NSString *)getUUID;
///生成二维码
+ (UIImage *)imageWithUrl:(NSString *)url imageSize:(CGFloat)size;
///删除ToKen..
+(void)deleteTokenFile;
///返回时间
+ (NSString *)updateTime:(NSString * )theSeverTimer;
//返回商城价格
+(NSAttributedString *)returnMarketPriceWithString:(NSString *)string;
////把时间戳转换成时间
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString Format:(NSString *)format;
////上拉刷新
/////上下拉动刷新。。。。
+(SYGifHeader *)addHeaderRefreshWithBlock:(void (^)(void))block;
////下拉刷新
+(SYGifFoot *)addFooterRefreshWithBlock:(void (^)(void))block;
////返回带下划线的价格
+(NSAttributedString *)returnPriceMedicLineWithString:(NSString *)maketPrice;
////返回一个NAV方便跳转
+(XJNavigationController *)retrunNAV;
@end
