//
//  NSArray+BRAdd.m
//  MyBaseProject
//
//  Created by 任波 on 2017/4/27.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "NSArray+BRAdd.h"
#import "SBJsonWriter.h"

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

#pragma mark - 数组/字典 转 JSON字符串(使用第三方框架SBJson)
- (NSString *)SB_toJsonString {
    id obj = self;
    SBJsonWriter *jsonWrite = [[SBJsonWriter alloc] init];
    return [jsonWrite stringWithObject:obj];
}

@end
