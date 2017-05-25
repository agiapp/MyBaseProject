//
//  NSData+BRAdd.h
//  MyBaseProject
//
//  Created by 任波 on 2017/5/25.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (BRAdd)

/** 获取系统当前的时间戳，即当前时间距1970的秒数（以毫秒为单位） */
+ (NSString *)currentTimestamp;

@end
