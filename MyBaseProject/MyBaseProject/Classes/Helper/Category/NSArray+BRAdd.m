//
//  NSArray+BRAdd.m
//  MyBaseProject
//
//  Created by 任波 on 2017/4/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "NSArray+BRAdd.h"

@implementation NSArray (BRAdd)

#pragma mark - 数组/字典 转 json字符串
- (NSString *)toJsonString {
    NSError *error = nil;
    id obj = self;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        NSLog(@"数组转JSON字符串失败：%@", error);
    }
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
