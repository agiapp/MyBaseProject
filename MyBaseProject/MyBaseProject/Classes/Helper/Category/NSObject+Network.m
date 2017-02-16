//
//  NSObject+Network.m
//  MyBaseProject
//
//  Created by 任波 on 16/12/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NSObject+Network.h"

@implementation NSObject (Network)
/**
 *  这个类别是 对AFNetworking进行封装：这样封装的目的是，方便换框架。
 */
+ (AFHTTPSessionManager *)sharedAFManager {
    static AFHTTPSessionManager *manager=nil; //定义在括号内外没有区别
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager=[AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval=30;
        manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
        //[manager.requestSerializer setValue:@"" forHTTPHeaderField:@""]; //以后会用得上
    });
    return manager;
}

//1.对get请求的封装
+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id responseObject, NSError *))comletionHandle {
    //一、使用AFNetworking第三方框架 发送请求
    return [[self sharedAFManager] GET:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        comletionHandle(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        comletionHandle(nil, error);
    }];
    //二、使用其它方式(如，使用苹果原生的) 发送请求
    //    ...............................
}
//2.对post请求的封装
+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))comletionHandle {
    //一、使用AFNetworking第三方框架 发送请求
    return [[self sharedAFManager] POST:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        comletionHandle(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        comletionHandle(nil, error);
    }];
    //二、使用其它方式(如，使用苹果原生的) 发送请求
    //    ...............................
    
}

@end
