//
//  AppDelegate+Category.h
//  MyBaseProject
//
//  Created by 任波 on 16/12/10.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Category)

/** 把各种初始化操作,固定的操作 写入到类别中 */
- (void)initializeWithApplication:(UIApplication *)application;

@end
