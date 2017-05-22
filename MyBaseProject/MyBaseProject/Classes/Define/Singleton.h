//
//  Singleton.h
//  MyBaseProject
//
//  Created by 任波 on 2017/5/22.
//  Copyright © 2017年 apple. All rights reserved.
//

#ifndef Singleton_h
#define Singleton_h

/**
 *  封装单例工具类：把创建单例的操作抽象成宏
 */

// .h文件
#define singleton_interface(class) \
+ (instancetype)shared##class; \

// .m文件
#define singleton_implementation(class) \
static id _instance; \
+ (id)allocWithZone:(struct _NSZone *)zone { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##class { \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \

#endif /* Singleton_h */

