//
//  NSObject+Parse.m
//  MyBaseProject
//
//  Created by 任波 on 16/12/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NSObject+Parse.h"

@implementation NSObject (Parse)
/** MJExtension是从模型(属性名) <-> JSON数据(key) */
+ (id)parse:(id)responseObj{
    if ([responseObj isKindOfClass:[NSArray class]]) {
        return [self mj_objectArrayWithKeyValuesArray:responseObj];
    }
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
        return [self mj_objectWithKeyValues:responseObj];
    }
    return responseObj;
}

@end
