//
//  NSData+Extension.h
//  MyBaseProject
//
//  Created by 任波 on 17/3/29.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Extension)
/**
 *  获取系统时间
 *
 */
+ (NSString *)currentSystemTimeWithFormat:(NSString *)formatStr;

/**
 *  返回指定时间差值的日期字符串
 *  @param delta 时间差值
 *  @return 日期字符串，格式：yyyy-MM-dd HH:mm:ss
 */
+ (NSString *)dateStringWithDelta:(NSTimeInterval)delta;

/**
 *  返回日期格式字符串
 *  @param formatStr 需要转换的时间点
 *  @return 日期字符串
 *    返回具体格式如下：
 *      - 刚刚(一分钟内)
 *      - X分钟前(一小时内)
 *      - X小时前(当天)
 *      - MM-dd HH:mm(一年内)
 *      - yyyy-MM-dd HH:mm(更早期)
 */
+ (NSString *)dateDescriptionWithTargetDate:(NSString *)dateStr andTargetDateFormat:(NSString *)dateFormatStr;

@end
