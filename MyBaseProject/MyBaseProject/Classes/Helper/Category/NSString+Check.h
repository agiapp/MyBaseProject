//
//  NSString+Check.h
//  MyBaseProject
//
//  Created by 任波 on 17/3/9.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Check)
/** 正则匹配手机号 */
+ (BOOL)checkTelNumber:(NSString *) telNumber;

/** 正则匹配用户密码6-18位数字和字母组合 */
+ (BOOL)checkPassword:(NSString *) password;

/** 正则匹配用户姓名,20位的中文或英文 */
+ (BOOL)checkUserName : (NSString *) userName;

/** 正则匹配邮箱 */
+ (BOOL)checkUserEmail:(NSString *)email;

/** 正则匹配银行卡号 */
+ (BOOL)checkUserBankNumber:(NSString *)BankNumber;

/** 正则匹配用户身份证号 */
+ (BOOL)checkIDCardNumber:(NSString *)value;

@end
