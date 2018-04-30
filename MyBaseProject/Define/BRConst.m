//
//  BRConst.m
//  MyBaseProject
//
//  Created by 任波 on 2018/4/30.
//  Copyright © 2018年 91renb. All rights reserved.
//

#import "BRConst.h"
#import "BRConfig.h"

#if APP_DEVELOP_SERVER
NSString *const BSAPIURL        = @"http://10.8.3.166:8100/cas-app/";
NSString *const BSIMAGEURL      = @"http://10.8.3.166:8110/cfs-file/upload/image/";
NSString *const BSWEBURL        = @"http://10.8.3.166:8120/cas-api/routing/thirdpart";
#endif

#if APP_TEST_SERVER
NSString *const BSAPIURL        = @"http://10.8.3.166:8100/cas-app/";
NSString *const BSIMAGEURL      = @"http://10.8.3.166:8110/cfs-file/upload/image/";
NSString *const BSWEBURL        = @"http://10.8.3.166:8120/cas-api/routing/thirdpart";
#endif

#if APP_PRODUCT_SERVER
NSString *const BSAPIURL        = @"http://10.8.3.166:8100/cas-app/";
NSString *const BSIMAGEURL      = @"http://10.8.3.166:8110/cfs-file/upload/image/";
NSString *const BSWEBURL        = @"http://10.8.3.166:8120/cas-api/routing/thirdpart";
#endif

//=================来自服务端定义=============

// 消息推送通知key
NSString *const BSNotificationLocationSuccessKey = @"BSNotificationLocationSuccessKey";

// 首页数据缓存 key
NSString *const BSUserDefaultsHomeDataKey = @"BSUserDefaultsHomeDataKey";
