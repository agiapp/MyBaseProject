//
//  UIImageView+BRAdd.m
//  MyBaseProject
//
//  Created by 任波 on 2017/5/17.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "UIImageView+BRAdd.h"

@implementation UIImageView (BRAdd)

#pragma mark -  通过设置 layer 切圆角
- (void)setLayerCornerRadius:(CGFloat)radius {
    self.layer.masksToBounds = YES;
    // 设置圆角半径
    self.layer.cornerRadius = radius;
}

#pragma mark - 使用 CAShapeLayer 和 UIBezierPath 设置圆角
- (void)setBezierPathCornerRadius:(CGFloat)radius {
    // 创建BezierPath 并设置角 和 半径 这里只设置了 左上 和 右上
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.frame = self.bounds;
    layer.path = path.CGPath;
    self.layer.mask = layer;
}

#pragma mark - 通过 Graphics 和 BezierPath 设置圆角（推荐用这个）
- (void)setGraphicsCornerRadius:(CGFloat)radius {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius] addClip];
    [self drawRect:self.bounds];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束
    UIGraphicsEndImageContext();
}

@end
