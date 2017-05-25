//
//  NSData+BRAdd.m
//  MyBaseProject
//
//  Created by 任波 on 2017/5/25.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "NSData+BRAdd.h"

@implementation NSData (BRAdd)

#pragma mark - 获取系统当前的时间戳，即当前时间距1970的秒数（以毫秒为单位）
+ (NSString *)currentTimestamp {
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    /** 当前时间距1970的秒数。*1000 是精确到毫秒，不乘就是精确到秒 */
    NSTimeInterval interval = [date timeIntervalSince1970] * 1000;
    NSString *timeString = [NSString stringWithFormat:@"%0.f", interval];
    
    return timeString;
}

@end
