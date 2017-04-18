//
//  NSString+BRAdd.h
//  MyBaseProject
//
//  Created by 任波 on 17/4/18.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BRAdd)

/** 判断字符串是否为空字符 */
- (BOOL)isBlankString;

/** 正则匹配手机号 */
- (BOOL)checkTelNumber;

/** 正则匹配用户密码6-18位数字和字母组合 */
- (BOOL)checkPassword;

/** 正则匹配用户姓名,20位的中文或英文 */
- (BOOL)checkUserName;

/** 正则匹配邮箱 */
- (BOOL)checkUserEmail;

/** 正则匹配银行卡号 */
- (BOOL)checkUserBankNumber;

/** 正则匹配用户身份证号 */
- (BOOL)checkIDCardNumber;


@end
