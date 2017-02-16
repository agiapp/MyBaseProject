//
//  NSObject+Network.h
//  MyBaseProject
//
//  Created by 任波 on 16/12/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h> //专门发网络请求
#import <UIKit+AFNetworking.h> //对UIKit的扩展

@interface NSObject (Network)

/**
 *  对AFNetworking进行封装：
 *
 *  网络请求类型：get 和 post 两种
 *  get请求：传递小型数据,一般传数据(简单的字符串...)
 *  post请求：传递大型数据，一般传zip/图片/音乐...
 *  另一个区别：get是明文的，post是加密的(简单的加密，很容易解开)。
 *  具体使用哪个请求：由服务器人员规定，自己不要操心
 */
//1.对get请求的封装
+ (id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void(^)(id responseObject, NSError *error))completionHandle;
//2.对post请求的封装
+ (id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void(^)(id responseObject, NSError *error))completionHandle;

@end
