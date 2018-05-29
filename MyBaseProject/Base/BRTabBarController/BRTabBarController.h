//
//  BRTabBarController.h
//  MyBaseProject
//
//  Created by 任波 on 2018/5/29.
//  Copyright © 2018年 91renb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BRTabBarController : UITabBarController
/**
 设置小红点
 
 @param index tabbar下标
 @param isShow 是显示还是隐藏
 */
-(void)setRedDotWithIndex:(NSInteger)index isShow:(BOOL)isShow;

@end
