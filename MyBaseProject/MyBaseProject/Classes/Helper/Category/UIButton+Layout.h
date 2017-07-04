//
//  UIButton+Layout.h
//  MyBaseProject
//
//  Created by 任波 on 2017/7/4.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BRButtonEdgeInsetsStyle) {
    BRButtonEdgeInsetsStyleTop,     // image在上，label在下
    BRButtonEdgeInsetsStyleLeft,    // image在左，label在右
    BRButtonEdgeInsetsStyleBottom,  // image在下，label在上
    BRButtonEdgeInsetsStyleRight    // image在右，label在左
};

@interface UIButton (Layout)
/**
 *  设置button的文字和图片的布局样式，及间距
 *
 *  @param style 文字和图片的布局样式
 *  @param space 文字和图片的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(BRButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

@end
