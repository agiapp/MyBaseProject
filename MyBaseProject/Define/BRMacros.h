//
//  BRMacros.h
//  MyBaseProject
//
//  Created by 任波 on 2018/4/30.
//  Copyright © 2018年 91renb. All rights reserved.
//

#ifndef BRMacros_h
#define BRMacros_h

/// 屏幕大小、宽、高
#define SCREEN_BOUNDS [UIScreen mainScreen].bounds
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

// 当前线程
#define CURRENT_THREAD NSLog(@"当前线程：%@", [NSThread currentThread]);

/// AppDelegate 对象
#define appDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

/// 保证 #ifdef 中的宏定义只会在 OC 的代码中被引用。否则，一旦引入 C/C++ 的代码或者框架，就会出错！
#ifdef __OBJC__

// 日志输出宏定义
#ifdef DEBUG
// 调试状态
// #define NSLog(fmt, ...) NSLog((@" %s [第%d行] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define NSLog(FORMAT, ...) fprintf(stderr, "【%s: %zd】%s %s\n", [[[NSString stringWithUTF8String: __FILE__] lastPathComponent] UTF8String], __LINE__, __func__, [[NSString stringWithFormat: FORMAT, ## __VA_ARGS__] UTF8String]);
#else
// 发布状态
#define NSLog(...)
#endif

#endif

#endif /* BRMacros_h */
