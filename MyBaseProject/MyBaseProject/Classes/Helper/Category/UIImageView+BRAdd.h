//
//  UIImageView+BRAdd.h
//  MyBaseProject
//
//  Created by 任波 on 2017/5/17.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (BRAdd)

/** 通过设置 layer 切圆角 */
- (void)setLayerCornerRadius:(CGFloat)radius;

/** 使用 CAShapeLayer 和 UIBezierPath 设置圆角 */
- (void)setBezierPathCornerRadius:(CGFloat)radius;

/** 通过 Graphics 和 BezierPath 设置圆角（推荐用这个）*/
- (void)setGraphicsCornerRadius:(CGFloat)radius;

@end
