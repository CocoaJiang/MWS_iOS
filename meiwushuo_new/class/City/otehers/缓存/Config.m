//
//  Config.m
//  iphoneLive
//
//  Created by cat on 16/3/9.
//  Copyright © 2016年 cat. All rights reserved.
//
#import "Config.h"
NSString * const KAvatar = @"avatar";
NSString * const KBirthday = @"birthday";
NSString * const KCoin = @"coin";
NSString * const KID = @"ID";
NSString * const KSex = @"sex";
NSString * const KToken = @"token";
NSString * const KUser_nicename = @"user_nicename";
NSString * const KSignature = @"signature";
NSString * const Kcity = @"city";
NSString * const Klevel = @"level";
NSString * const kavatar_thumb = @"avatar_thumb";
NSString * const Klogin_type = @"login_type";
NSString * const Klevel_anchor = @"level_anchor";
NSString * const vip_type = @"vip_type";
NSString * const liang = @"liang";


@implementation Config
#pragma mark - user profile

//保存靓号和vip
+(void)saveVipandliang:(NSDictionary *)subdic{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:minstr([subdic valueForKey:@"vip_type"]) forKey:@"vip_type"];
    [userDefaults setObject:minstr([subdic valueForKey:@"liang"]) forKey:@"liang"];
    [userDefaults synchronize];
}
+(NSString *)getVip_type{
    
    NSUserDefaults *userDefults = [NSUserDefaults standardUserDefaults];
    NSString *viptype = minstr([userDefults objectForKey:vip_type]);
    return viptype;
    
}
+(NSString *)getliang{
    
    NSUserDefaults *userDefults = [NSUserDefaults standardUserDefaults];
    NSString *liangnum = minstr( [userDefults objectForKey:liang]);
    return liangnum;
    
}



+ (void)saveProfile:(LiveUser *)user
{
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc]init ];
    [userDefaults setObject:user.avatar forKey:KAvatar];
    [userDefaults setObject:user.avatar_thumb forKey:kavatar_thumb];
    [userDefaults setObject:user.coin forKey:KCoin];
    [userDefaults setObject:user.sex forKey:KSex];
    [userDefaults setObject:user.ID forKey:KID];
    [userDefaults setObject:user.token forKey:KToken];
    [userDefaults setObject:user.user_nicename forKey:KUser_nicename];
    [userDefaults setObject:user.signature forKey:KSignature];
    [userDefaults setObject:user.login_type forKey:Klogin_type];
    [userDefaults setObject:user.avatar forKey:Klevel_anchor];
    [userDefaults setObject:user.birthday forKey:KBirthday];
    [userDefaults setObject:user.city forKey:Kcity];
    [userDefaults setObject:user.level forKey:Klevel];
    [userDefaults synchronize];
    //传递大s头像
    UIPasteboard *pasteavatar = [UIPasteboard pasteboardWithName:[NSString stringWithFormat:@"%@avatar",connectname] create:YES];
    pasteavatar.string = user.avatar;
    
    //传递小头像
    UIPasteboard *pasteaavatar_thumb = [UIPasteboard pasteboardWithName:[NSString stringWithFormat:@"%@avatar_thumb",connectname] create:YES];
    pasteaavatar_thumb.string = user.avatar_thumb;
    
    //传递id
    UIPasteboard *pasteaID = [UIPasteboard pasteboardWithName:[NSString stringWithFormat:@"%@ID",connectname] create:YES];
    pasteaID.string = user.ID;
    
    //传递name
    UIPasteboard *pasteauser_nicename = [UIPasteboard pasteboardWithName:[NSString stringWithFormat:@"%@user_nicename",connectname] create:YES];
    pasteauser_nicename.string = user.user_nicename;
    
    //传递token
    UIPasteboard *pastetoken= [UIPasteboard pasteboardWithName:[NSString stringWithFormat:@"%@token",connectname] create:YES];
    pastetoken.string = user.token;
    
    //传递余额
    UIPasteboard *pastecoin = [UIPasteboard pasteboardWithName:[NSString stringWithFormat:@"%@coin",connectname] create:YES];
    pastecoin.string = user.coin;
    
    //传递性别
    UIPasteboard *pastesex = [UIPasteboard pasteboardWithName:[NSString stringWithFormat:@"%@sex",connectname] create:YES];
    pastesex.string = user.sex;
    
    //传递个签
    UIPasteboard *pastesignature = [UIPasteboard pasteboardWithName:[NSString stringWithFormat:@"%@signature",connectname] create:YES];
    pastesignature.string = user.signature;
    
    //传递等级
    UIPasteboard *pastelevel = [UIPasteboard pasteboardWithName:[NSString stringWithFormat:@"%@level",connectname] create:YES];
    pastelevel.string = user.level;
    
    //传递城市
    UIPasteboard *pastecity = [UIPasteboard pasteboardWithName:[NSString stringWithFormat:@"%@city",connectname] create:YES];
    pastecity.string = user.city;
    
    
    
}
+ (void)updateProfile:(LiveUser *)user
{
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc]init ];
       if(user.level_anchor != nil) [userDefaults setObject:user.level_anchor forKey:Klevel_anchor];
    if(user.user_nicename != nil) [userDefaults setObject:user.user_nicename forKey:KUser_nicename];
    if(user.signature!=nil) [userDefaults setObject:user.signature forKey:KSignature];
    if(user.avatar!=nil) [userDefaults setObject:user.avatar forKey:KAvatar];
    if(user.avatar_thumb!=nil) [userDefaults setObject:user.avatar_thumb forKey:kavatar_thumb];
    if(user.coin!=nil) [userDefaults setObject:user.coin forKey:KCoin];
    if(user.birthday!=nil) [userDefaults setObject:user.birthday forKey:KBirthday];
    if(user.login_type!=nil) [userDefaults setObject:user.login_type forKey:Klogin_type];
    if(user.city!=nil) [userDefaults setObject:user.city forKey:Kcity];
    if(user.sex!=nil) [userDefaults setObject:user.sex forKey:KSex];
    if(user.level!=nil) [userDefaults setObject:user.level forKey:Klevel];
    
    [userDefaults synchronize];
}

+ (void)clearProfile
{
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc]init ];
     [userDefaults setObject:nil forKey:Klevel_anchor];
    [userDefaults setObject:nil forKey:Klevel_anchor];
    [userDefaults setObject:nil forKey:KAvatar];
    [userDefaults setObject:nil forKey:KBirthday];
    [userDefaults setObject:nil forKey:KCoin];
    [userDefaults setObject:nil forKey:KID];
    [userDefaults setObject:nil forKey:KSex];
    [userDefaults setObject:nil forKey:KToken];
    [userDefaults setObject:nil forKey:KUser_nicename];
    [userDefaults setObject:nil forKey:Klogin_type];
    [userDefaults setObject:nil forKey:KSignature];
    [userDefaults setObject:nil forKey:Kcity];
    [userDefaults setObject:nil forKey:Klevel];
    [userDefaults setObject:nil forKey:kavatar_thumb];
    
    
    [userDefaults synchronize];
}

+ (LiveUser *)myProfile
{
    
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc]init ];
    
    LiveUser *user = [[LiveUser alloc] init];
    user.avatar = [userDefaults objectForKey: KAvatar];
    user.birthday = [userDefaults objectForKey: KBirthday];
    user.coin = [userDefaults objectForKey: KCoin];
    user.level_anchor = [userDefaults objectForKey: Klevel_anchor];
    user.ID = [userDefaults objectForKey: KID];
    user.sex = [userDefaults objectForKey: KSex];
    user.token = [userDefaults objectForKey: KToken];
    user.user_nicename = [userDefaults objectForKey: KUser_nicename];
    user.signature = [userDefaults objectForKey:KSignature];
    user.level = [userDefaults objectForKey:Klevel];
    user.city = [userDefaults objectForKey:Kcity];
    user.avatar_thumb = [userDefaults objectForKey:kavatar_thumb];
    user.login_type = [userDefaults objectForKey:Klogin_type];
    
    
    return user;
}

+(NSString *)getOwnID
{
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc]init ];
    NSString* ID = [userDefaults objectForKey: KID];
    return ID;
}

+(NSString *)getOwnNicename
{
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc]init ];
    NSString* nicename = [userDefaults objectForKey: KUser_nicename];
    return nicename;
}

+(NSString *)getOwnToken
{
    
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc]init ];
    NSString *token = [userDefaults objectForKey:KToken];
    return token;
}

+(NSString *)getOwnSignature
{
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc]init ];
    NSString *signature = [userDefaults objectForKey:KSignature];
    return signature;
}
+(NSString *)getavatar
{
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc]init ];
    NSString *avatar = [NSString stringWithFormat:@"%@",[userDefaults objectForKey:KAvatar]];
    return avatar;
}
+(NSString *)getavatarThumb
{
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc]init ];
    NSString *signature = [userDefaults objectForKey:kavatar_thumb];
    return signature;
}
+(NSString *)getLevel
{
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc]init ];
    NSString *level = [userDefaults objectForKey:Klevel];
    return level;
}
+(NSString *)getSex
{
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc]init ];
    NSString *sex = [userDefaults objectForKey:KSex];
    return sex;
}
+(NSString *)level_anchor
{
    NSUserDefaults *userDefults = [NSUserDefaults standardUserDefaults];
    NSString *level_anchors = [userDefults objectForKey:Klevel_anchor];
    return level_anchors;
}
@end
