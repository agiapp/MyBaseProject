//
//  KeychainTool.h
//  RiShangProject
//
//  Created by 杨振 on 2016/10/28.
//  Copyright © 2016年 刘天正. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeychainTool : NSObject
/**
 *  储存字符串到🔑钥匙串
 *
 *  @param sValue 对应的Value
 *  @param sKey   对应的Key
 */
+ (void)saveKeychainValue:(NSString *)sValue key:(NSString *)sKey;


/**
 *  从🔑钥匙串获取字符串
 *
 *  @param sKey 对应的Key
 *
 *  @return 返回储存的Value
 */
+ (NSString *)readKeychainValue:(NSString *)sKey;


/**
 *  从🔑钥匙串删除字符串
 *
 *  @param sKey 对应的Key
 */
+ (void)deleteKeychainValue:(NSString *)sKey;
@end
