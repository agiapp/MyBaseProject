//
//  UINavigationController+Alpha.h
//  MyBaseProject
//
//  Created by 任波 on 17/3/29.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Alpha)
- (void)br_setBackgroundColor:(UIColor *)backgroundColor;
- (void)br_setElementsAlpha:(CGFloat)alpha;
- (void)br_setTranslationY:(CGFloat)translationY;
- (void)br_reset;

@end
