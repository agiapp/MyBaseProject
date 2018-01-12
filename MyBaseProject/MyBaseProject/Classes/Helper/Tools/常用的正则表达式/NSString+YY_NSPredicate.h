//
//  NSString+YY_NSPredicate.h
//  iOSMp4Camera
//
//  Created by 杨振 on 16/6/22.
//  Copyright © 2016年 xiaoxuan Tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YY_NSPredicate)

//邮箱
+ (BOOL) validateEmail:(NSString *)email;

//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile;

//车牌号验证
+ (BOOL) validateCarNo:(NSString *)carNo;

//车型
+ (BOOL) validateCarType:(NSString *)CarType;

//用户名
+ (BOOL) validateUserName:(NSString *)name;

//密码
+ (BOOL) validatePassword:(NSString *)passWord;

//昵称
+ (BOOL) validateNickname:(NSString *)nickname;

//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard;

@end
