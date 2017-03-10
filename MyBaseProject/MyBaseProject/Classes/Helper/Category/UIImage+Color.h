//
//  UIImage+Color.h
//  MyBaseProject
//
//  Created by 任波 on 17/3/10.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

/** 用颜色返回一张图片 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/** 为UIImage添加滤镜效果 */
- (UIImage *)addFilter:(NSString *)filter;

@end
