//
//  HttpTool.m
//  PeopleHabit
//
//  Created by Andy on 2018/12/11.
//  Copyright © 2018 SMXK. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking.h"
#import "NSString+MD5String.h"
#import "XJloginViewController.h"
#import "XJRegisViewController.h"
@implementation HttpTool

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
+ (AFHTTPSessionManager *)defaultManager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    AFJSONResponseSerializer *reson = [AFJSONResponseSerializer serializer];
    reson.removesKeysWithNullValues = YES;
    reson.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    manager.responseSerializer = reson;
    manager.requestSerializer.timeoutInterval =30.0f;
    return manager;
}
+ (void)POST:(NSString *)url param:(NSMutableDictionary *)param success:(SucceedBlock)successCallback error:(ErrorBlock)errorCallback
{
    
    [Tools ShowLoading];
    AFHTTPSessionManager *manager = [self defaultManager];
    NSString *url_f8 = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    if ([[Tools readToken] length]>0) {
        url = [NSString stringWithFormat:@"%@?token=%@",url,[Tools readToken]];
    }
    NSLog(@"请求的参数是:%@\n请求的地址是:%@",param,url_f8);
    [manager POST:url_f8 parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSInteger code = [[responseObject objectForKey:@"status"] integerValue];
        NSString *message = [[responseObject objectForKey:@"result"]objectForKey:@"message"];
        [Tools hideView];
        switch (code) {
            case 0:
            {////成功。。。。。。
                
                NSLog(@"result==%@",responseObject);
                if (successCallback) {
                    successCallback(responseObject);
                }
            }
                break;
            case 1002: ////此时需要弹出消息通知。。。
            {
                if (successCallback) {
                    successCallback(responseObject);
                }
                [Tools showSuccessWithString:message];
                
            }
                break;
                
            case 1003: ////此时需要更新数据。。
            {
                if (successCallback) {
                    successCallback(responseObject);
                }
      
                [Tools showSuccessWithString:@"更新数据"];
            }
                break;
                
            case 1004:
            {
                if (successCallback) {
                    successCallback(responseObject);
                }

                  [Tools showSuccessWithString:@"导航新页面"];
                
            }break;
                
            case 2001:
            {
                
                if (successCallback) {
                    successCallback(responseObject);
                }
              

                [Tools showErrorWithString:message];
                
            }break;
                
                
            case 2002:
            {
                if (successCallback) {
                    successCallback(responseObject);
                }
      
                
                
            }break;
                
            case 2003:
            {
                if (successCallback) {
                    successCallback(responseObject);
                }
          
    
                [Tools showErrorWithString:@"更新数据"];

            }break;
                
            case 2004:
            {
                if (successCallback) {
                    successCallback(responseObject);
                }
              
      
                [Tools showErrorWithString:@"更新数据"];
                
            }break;
                
            case 2005:
            {
              
    
               ////此时应该推出APP到登陆页面。。。。。
                [[Tools retrunNAV]pushViewController:[XJloginViewController new] animated:YES];
                
            }
                break;
                
            case 3001:
            {
                [Tools showErrorWithString:message];
                
            }break;
                
            
                
            case 3011:
            {
  
                [Tools showError:message andWithDoEveryThingWithBlock:^{
                    [[Tools retrunNAV ]pushViewController:[XJRegisViewController new] animated:YES];
                }];
             
                
            }break;
                
            case 3012:
            {
      
                [Tools showError:message andWithDoEveryThingWithBlock:^{
                    [[Tools retrunNAV ]pushViewController:[XJloginViewController new] animated:YES];
                }];
                
                
            }break;
                
                
            case 2013:
            {
        
                [Tools showError:message andWithDoEveryThingWithBlock:^{
                    [[Tools retrunNAV ]pushViewController:[XJRegisViewController new] animated:YES];
                }];
                
                
            }break;
                
            case 2023:
            {
      
                [Tools showError:message andWithDoEveryThingWithBlock:^{
                    [[Tools retrunNAV ]pushViewController:[XJloginViewController new] animated:YES];
                }];
                
                
            }break;
                
            default:
                break;
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            if (errorCallback) {
                errorCallback(error.localizedDescription);
            }
            [Tools hideView];
        }
    }];
    
}

+(void)get:(NSString *)url param:(NSDictionary *)param success:(SucceedBlock)successCallback error:(ErrorBlock)errorCallback{
 //   AFHTTPSessionManager *manager = [self defaultManager];
    
//    NSString *url_f8 = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    manager.requestSerializer.timeoutInterval = 20.0f;
//    [manager GET:url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (successCallback) {
//            successCallback(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        if (error) {
//
//            if (errorCallback) {
//                errorCallback(error.localizedDescription);
//            }
//        }
//    }];
    
}
+(void)upLoadmageData:(NSData *)imageData Url:(NSString *)url dict:(NSDictionary *)dic succed:(SucceedBlock)succed errorBlock:(ErrorBlock)errorBlock
{
//    [ZQHelper showLoadHint:@"加载中。。。"];
//    AFHTTPSessionManager *manager = [self defaultManager];
//    NSString *url_f8 = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//    manager.requestSerializer.timeoutInterval = 20.0f;
//
//    [manager POST:url_f8 parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//
//        [formData appendPartWithFileData:imageData name:@"file" fileName:@"image.png" mimeType:@"image/png"];
//
//        NSLog(@"%@",formData);
//
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//        if (succed) {
//
//            [ZQHelper dismiss];
//
//            succed (responseObject);
//
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//        [ZQHelper showErrorHint:error.localizedDescription];
//
//        if (errorBlock) {
//
//            errorBlock(error.localizedDescription);
//        }
//
//    }];
    
}


+ (void)NOACtionPOST:(NSString *)url param:(NSMutableDictionary *)param success:(SucceedBlock)successCallback error:(ErrorBlock)errorCallback
{
    AFHTTPSessionManager *manager = [self defaultManager];
    
    if ([[Tools readToken] length]>0) {
        url = [NSString stringWithFormat:@"%@?token=%@",url,[Tools readToken]];
    }
    NSString *url_f8 = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [manager POST:url_f8 parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([[responseObject objectForKey:@"code"] integerValue]==0) {
            if ([[responseObject objectForKey:@"token"] length]>0) {
                [Tools writeWithTokenWithString:[responseObject objectForKey:@"token"]];
            }
            if (successCallback) {
                successCallback(responseObject);
            }
        }else if ([[responseObject objectForKey:@"code"] integerValue]==4100){
          
            [Tools showError:[responseObject objectForKey:@"message"] andWithDoEveryThingWithBlock:^{
               
            }];
        }else{
            [Tools showErrorWithString:[responseObject objectForKey:@"message"]];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            if (errorCallback) {
                errorCallback(error.localizedDescription);
            }
        }
    }];
    
}










@end
