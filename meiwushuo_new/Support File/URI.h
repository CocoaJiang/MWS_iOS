//
//  URI.h
//  meiwushuo_new
//
//  Created by pro on 2019/6/25.
//  Copyright © 2019 com.MWS. All rights reserved.
//

#ifndef URI_h
#define URI_h
#import <UIKit/UIKit.h>
///////本来是AFNETWORKINGD的Ton告知 不想导入文件 提高编译速度设置成静态变量不可能改。。。
static NSString * const KVEYSTRING =           @"com.alamofire.networking.reachability.change";
////AFNETWORKING 接受WIFI的字段。
static NSString * const KWIFI =                @"AFNetworkingReachabilityNotificationStatusItem";
/******************************************接口状态码****************************************************
1001                成功：不需要任何操作
1002                成功：弹出消息通知
1003                成功：更新数据
1004                成功：导航至新页面
2001                失败：弹出消息通知
2002                失败：不做处理
2003                失败：导航至新页面
2004                失败：刷新当前页
2005                失败：退出app到登录界面
3001                提示：弹出消息提示
3011                弹出消息提示后导航至注册页面
3012                弹出消息提示后导航至登录页面
2013                导航至登录页    接口响应code
2023                导航至注册页    接口响应code
******************************************接口状态码*****************************************************/
#define APPSevers @"http://wx2.mwsvip.cn/app/ewei_shopv2_app_api.php?i=1&r="
///获取地址列表--->省市区供用户填写
#define AddRessList                                 @"Shop.GetRegin"
////获取我的地址列表
#define PostMyAddress                               @"Shop.PostMyAddress"
////删除地址
#define DelAddress                                  @"User.DelAddress"
////发送验证码
#define Getsmscode                                  @"account.getsmscode"












#endif /* URI_h */
