//
//  Tools.m
//  IntelligentFire
//
//  Created by Andy on 2018/8/19.
//  Copyright © 2018年 SMXK. All rights reserved.
//

#import "Tools.h"
#import <TZImageManager.h>
#import <TZImagePickerController.h>
@interface Tools ()<TZImagePickerControllerDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) UIViewController *VC;
@property (nonatomic, copy) ImageBlock block;
@property (nonatomic, copy) MoreImageBlock imagesBlock;
@property(copy,nonatomic)MoreAttestBlock attrsBlock;
@property(strong,nonatomic)NSMutableArray *imagesArray;

@end
@implementation Tools

static Tools *tools = nil;
+ (Tools *)shareTools
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[super allocWithZone:NULL] init];
    });
    return tools;
}
//封装过用户选择过的数组
+(void)XJ_morePickerController:(UIViewController *)controller image:(MoreImageBlock)block :(NSInteger)maxCount andSeletedArray:(NSMutableArray *)seltedArray andWithAttesBlock:(MoreAttestBlock)attsBlock{
    [self shareTools].VC = controller;
    [self shareTools].imagesBlock = block;
    [self shareTools].attrsBlock = attsBlock;
    TZImagePickerController *picker = [[TZImagePickerController alloc] initWithMaxImagesCount:maxCount delegate:tools];
    picker.selectedAssets = seltedArray;
    picker.barItemTextColor =[UIColor whiteColor];
    picker.naviTitleColor = [UIColor whiteColor];
    picker.allowPickingVideo = NO;
    picker.allowPickingOriginalPhoto = NO;
    [controller presentViewController:picker animated:YES completion:nil];
}
//选择完图片回调
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos
{
    
    if (self.imagesBlock) {
        self.imagesBlock(photos);
    }
    if (self.attrsBlock) {
        self.attrsBlock(assets);
    }
    
}

//图片选择
+ (void)imagePickerAtController:(UIViewController *)VC image:(ImageBlock)block
{
    [self shareTools].VC = VC;
    [self shareTools].block = block;
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    if ([imagePickerController.navigationBar respondsToSelector:@selector(setBarTintColor:)]) {
        [imagePickerController.navigationBar setBarTintColor:[UIColor whiteColor]];
        [imagePickerController.navigationBar setTranslucent:NO];
        [imagePickerController.navigationBar setTintColor:[UIColor whiteColor]];
    }else{
        [imagePickerController.navigationBar setBackgroundColor:[UIColor whiteColor]];
    }
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [imagePickerController.navigationBar setTitleTextAttributes:attrs];
    UIViewController *currentVC = [tools getCurrentVC ];
    [Tools showActionSheetWithTitle:nil message:nil items:@[@"Take photos",@"Photo album"] atController:VC SourceView:currentVC.view action:^(NSUInteger itemIndex){
        if (itemIndex == 0) {
            //判断是否具有拍照能力
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                //判断前后摄像头是否可用
                if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront] && [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear])
                {
                    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
                }
            }
            else
            {
               // [EasyTextView showText:@"摄像头故障"];
                // [Tools showAlertMessage:@"摄像头故障"];
                return;
            }
            
        }if (itemIndex ==1) {
            //设置图片选择器的数据从图片库中取出
            imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            //设置代理
            
        }
        imagePickerController.delegate = tools;
        imagePickerController.allowsEditing = YES;
        //弹出图片选择器
        
        
        [VC presentViewController:imagePickerController animated:YES completion:nil];
        
    }];
    
}



/*****<判断是否需要登录>*****/
+(BOOL)isLogin{
    
    return YES;
}

+ (void)showActionSheetWithTitle:(NSString *)title message:(NSString *)message items:(NSArray *)items atController:(UIViewController *)controller  SourceView:(UIView *)sender action:(ItemAction)itemAction

{
    
    UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [actionSheetController addAction:cancelAction];
    [items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIAlertAction *sheetAction = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            itemAction(idx);
        }];
        [actionSheetController addAction:sheetAction];
    }];
    
    UIPopoverPresentationController *popover = actionSheetController.popoverPresentationController;if (popover) {
        
        popover.sourceView = sender;
    }
    dispatch_async(dispatch_get_main_queue(),^{
        [controller presentViewController:actionSheetController animated:YES completion:nil];
        
    });
    
}
- (UIViewController *)getCurrentVC
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}

- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        
        rootVC = [rootVC presentedViewController];
    }
    
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
        
    } else {
        // 根视图为非导航类
        
        currentVC = rootVC;
    }
    
    return currentVC;
}
+ (UIViewController *)viewController:(UIView *)view {
    
    for (UIView *next = view; next; next = next.superview)
    {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
+(void)showLoadStatusWithString:(NSString*)string{
   // [SVProgressHUD setMinimumSize:CGSizeMake(100, 100)];
   // [SVProgressHUD showWithStatus:string];
}

+(void)hideView{
   // [SVProgressHUD dismiss];
}
+(void)showSuccessWithString:(NSString *)scuess{
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
//        [SVProgressHUD setMinimumSize:CGSizeMake(100, 50)];
//        [SVProgressHUD showSuccessWithStatus:scuess];
//        //  [SVProgressHUD showImage:[UIImage imageNamed:@"收藏"] status:scuess];
//        [SVProgressHUD dismissWithDelay:0.5];
//    });
}


+(void)showStatusWithString:(NSString*)string{
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
//        [SVProgressHUD setMinimumSize:CGSizeMake(100, 100)];
//        [SVProgressHUD showInfoWithStatus:string];
//        [SVProgressHUD dismissWithDelay:0.5];
//    });
}

+(void)showErrorWithString:(NSString*)errorString{
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
//        [SVProgressHUD setMinimumSize:CGSizeMake(100, 100)];
//        [SVProgressHUD showInfoWithStatus:errorString];
//        [SVProgressHUD dismissWithDelay:0.5];
//    });
    
}

+(id)XJ_XibWithName:(NSString *)xibName{
    
    return [[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil].firstObject;
}




+(NSString *)alertText{
  
 
    return @"您还未购买过商品,暂无权限";
    
}


+(UIImage *)EmptyImage{
    
    return [UIImage imageNamed:@"empty"];
}


+(NSAttributedString *)ReturnWithString:(NSString *)stringOne
                           andWithColor:(UIColor *)colorOne
                            andWithFont:(CGFloat)fontOne
                          andWithString:(NSString *)stringTwo
                           andWithColor:(UIColor *)colorTwo
                            andWithFont:(CGFloat)fontTwo{
    NSMutableAttributedString * firstPart = [[NSMutableAttributedString alloc] initWithString:stringOne];
    NSDictionary * firstAttributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:fontOne],NSForegroundColorAttributeName:colorOne,};
    [firstPart setAttributes:firstAttributes range:NSMakeRange(0,firstPart.length)];
    NSMutableAttributedString * secend = [[NSMutableAttributedString alloc] initWithString:stringTwo];
    NSDictionary * sendAuuributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:fontTwo],NSForegroundColorAttributeName:colorTwo,};
    [secend setAttributes:sendAuuributes range:NSMakeRange(0,secend.length)];
   [firstPart appendAttributedString:secend];
    
    return (NSAttributedString *)firstPart;
    
}

+(NSAttributedString *)ReturnFontWithString:(NSString *)stringOne
                           andWithColor:(UIColor *)colorOne
                            andWithFont:(UIFont *)fontOne
                          andWithString:(NSString *)stringTwo
                           andWithColor:(UIColor *)colorTwo
                            andWithFont:(UIFont *)fontTwo{
    NSMutableAttributedString * firstPart = [[NSMutableAttributedString alloc] initWithString:stringOne];
    NSDictionary * firstAttributes = @{ NSFontAttributeName:fontOne,NSForegroundColorAttributeName:colorOne,};
    [firstPart setAttributes:firstAttributes range:NSMakeRange(0,firstPart.length)];
    NSMutableAttributedString * secend = [[NSMutableAttributedString alloc] initWithString:stringTwo];
    NSDictionary * sendAuuributes = @{ NSFontAttributeName:fontTwo,NSForegroundColorAttributeName:colorTwo,};
    [secend setAttributes:sendAuuributes range:NSMakeRange(0,secend.length)];
    [firstPart appendAttributedString:secend];
    
    return (NSAttributedString *)firstPart;
    
}


+(NSAttributedString *)returnWithString:(NSString *)string{
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont boldSystemFontOfSize:13.0f],
                                 NSForegroundColorAttributeName:[UIColor lightGrayColor]
                                 };
    return [[NSAttributedString alloc] initWithString:string attributes:attributes];
}


+(NSString *)returnBankCard:(NSString *)BankCardStr
{
    NSString *formerStr = [BankCardStr substringToIndex:3];
    NSString *str1 = [BankCardStr stringByReplacingOccurrencesOfString:formerStr withString:@""];
    NSString *endStr = [BankCardStr substringFromIndex:BankCardStr.length-4];
    NSString *str2 = [str1 stringByReplacingOccurrencesOfString:endStr withString:@""];
    NSString *middleStr = [str2 stringByReplacingOccurrencesOfString:str2 withString:@"****"];
    NSString *CardNumberStr = [formerStr stringByAppendingFormat:@"%@%@",middleStr,endStr];
    return CardNumberStr;
}

//给View 一边切圆 或者多变且元
+ (void)setMaskTo:(UIView*)view byRoundingCorners:(UIRectCorner)corners andWithCGSize:(CGSize )size{
    UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:size];
    CAShapeLayer *shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    view.layer.mask = shape;
}


//这是计算肌肤穿的高度
+(CGSize)XJCalculateTheSizeWithFont:(UIFont *)font andWithText:(NSString *)text andWithWidthMAX:(CGFloat)masW{
    CGFloat textMaxW = masW;
    CGSize textMaxSize = CGSizeMake(textMaxW, MAXFLOAT);
    CGSize textSize = [text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return textSize;
}
//计算 z文字的宽度

+(NSString *)retrunPriceWithPriceString:(NSString *)stringPrice{
    
    CGFloat flat = [stringPrice floatValue];
    
    return [NSString stringWithFormat:@"¥%0.2f",flat];
    
}


+(NSString*)getCurrentTimes{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // --
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]*1000];
    
    return timeSp;
    
}

//加密
+(void)writeWithTokenWithString:(NSString *)string
{
    // 获取Documents目录路径
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject];
    NSString *path = [NSString stringWithFormat:@"%@/data.plist",docDir];
    //取出来
    NSArray *array = [self readToken];
    if (!array) {
        array = [[NSArray alloc]init];
    }
    //然后把他存储到里面。。。
    NSMutableArray *array_add = [[NSMutableArray alloc]initWithArray:array];
    [array_add addObject:string];
    BOOL isWriteString = [(NSArray *)array_add writeToFile:path atomically:YES];
    if (!isWriteString) {
        [self showErrorWithString:@"存储失败"];
    }
}
+(NSArray*)readToken{
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject];
    NSString *path = [NSString stringWithFormat:@"%@/data.plist",docDir];
    NSArray *idArray = [[NSArray alloc]initWithContentsOfFile:path];
    return idArray;
}
+(void)deleteTokenFile{
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject];
    NSString *path = [NSString stringWithFormat:@"%@/data.plist",docDir];
    BOOL isDelete = [[NSFileManager defaultManager]removeItemAtPath:path error:nil];
    if (!isDelete) {
        [self showErrorWithString:@"文件删除失败"];
    }
}





//写入图片到相册。。。。。。
+(void)saveImaheWihtImage:(UIImage *)image
{
//    NSMutableArray *imageIds = [NSMutableArray array];
//    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
//        //写入图片到相册
//        PHAssetChangeRequest *req = [PHAssetChangeRequest creationRequestForAssetFromImage:image];
//        //记录本地标识，等待完成后取到相册中的图片对象
//        [imageIds addObject:req.placeholderForCreatedAsset.localIdentifier];
//    } completionHandler:^(BOOL success, NSError * _Nullable error) {
//        if (success)
//        {
//            //成功后取相册中的图片对象
//            __block PHAsset *imageAsset = nil;
//            PHFetchResult *result = [PHAsset fetchAssetsWithLocalIdentifiers:imageIds options:nil];
//            [result enumerateObjectsUsingBlock:^(PHAsset * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                imageAsset = obj;
//                *stop = YES;
//            }];
//            if (imageAsset)
//            {
//                //加载图片数据
//                [[PHImageManager defaultManager] requestImageDataForAsset:imageAsset
//                                                                  options:nil
//                                                            resultHandler:^(NSData * _Nullable imageData, NSString * _Nullable dataUTI, UIImageOrientation orientation, NSDictionary * _Nullable info) {
//                                                            }];
//            }
//
//            [Tools showSuccessWithString:@"已经成功保存到相册"];
//
//        }
//    }];
}

//制造一根细
+(UIView *)retunLineView{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    return view;
}
//getUUID
+(NSString *)getUUID{
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject];
    NSString *path = [NSString stringWithFormat:@"%@/UDIDSTRING",docDir];
    NSString *readstr = [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    if (readstr==nil||[readstr isEqualToString:@""]) {
       BOOL isWriteString = [[[NSUUID UUID]UUIDString] writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
        if (!isWriteString) {
           NSString *readstr = [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
            return readstr;
        }
    }
    return [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
}


//设计一个能存储播放记录的Plist 文件进行存储设置！！！！！！


+(void)ShowLoading{
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
//        [SVProgressHUD setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
//        [SVProgressHUD setFont:[UIFont systemFontOfSize:12]];
//        [SVProgressHUD setMinimumSize:CGSizeMake(100,100)];
//        NSMutableArray *images = [[NSMutableArray alloc]init];
//        NSArray *array = @[@"a7i",@"a7j",@"a7k",@"a7l",@"a7m",@"a7n",@"a7o",@"a7p",@"a7q",@"a7r",@"a7s",@"a7t",@"a7u",@"a7v",@"a7w",@"a7x",@"a7y",@"a7z"];
//        for (NSString *string in array) {
//            UIImage *image  = [UIImage imageNamed:string];
//            [images addObject:image];
//        }
//        UIImage *image = [UIImage animatedImageWithImages:images duration:0.3];
//        [SVProgressHUD showImage:image status:@"拼命加载中...."];
//    });
}

///生成二维码方法
+ (UIImage *)imageWithUrl:(NSString *)url imageSize:(CGFloat)size
{
    //创建过滤器
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    //过滤器恢复默认
    [filter setDefaults];
    //给过滤器添加数据
    NSString *string = url;
    //将NSString格式转化成NSData格式
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    [filter setValue:data forKeyPath:@"inputMessage"];
    //获取二维码过滤器生成的二维码
    CIImage *image = [filter outputImage];
    return [self createNonInterpolatedUIImageFormCIImage:image withSize:size];
    
}


/**
 2  *  根据CIImage生成指定大小的UIImage
 3  *
 4  *  @param image CIImage
 5  *  @param size  图片宽度
 6  */
+ (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

+ (NSString *)updateTime:(NSString * )theSeverTimer {
    // 获取当前时时间戳 1466386762.345715 十位整数 6位小数
    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
    // 创建歌曲时间戳(后台返回的时间 一般是13位数字)
    NSTimeInterval createTime = [theSeverTimer integerValue];
    // createTime = createTime/1000;
    // 时间差
    NSTimeInterval timeInterval = currentTime - createTime;
    
    long temp = 0;
    NSString *result;
    if (timeInterval/60 < 1)
    {
        result = [NSString stringWithFormat:@"刚刚"];
    }else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }else{
        temp = temp/12;result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return result;
}
+(NSAttributedString *)returnMarketPriceWithString:(NSString *)string{
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle],NSForegroundColorAttributeName:RGBA(153, 153, 153,1),NSFontAttributeName:[UIFont systemFontOfSize:13]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:string attributes:attribtDic];
    return attribtStr;
    
}



@end
