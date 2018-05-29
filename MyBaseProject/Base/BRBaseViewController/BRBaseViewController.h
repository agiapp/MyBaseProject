//
//  BRBaseViewController.h
//  MyBaseProject
//
//  Created by 任波 on 2018/5/29.
//  Copyright © 2018年 91renb. All rights reserved.
//

#import <UIKit/UIKit.h>

/// 自定义 ViewController 的基类
@interface BRBaseViewController : UIViewController
/** 修改状态栏颜色 */
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;
/** 是否显示返回按钮, 默认情况是NO */
@property (nonatomic, assign) BOOL hideBackBtn;
/** 默认返回按钮的点击事件，默认是返回，子类可重写 */
- (void)clickBackBtn;

/**
 *  导航栏添加图标按钮
 *
 *  @param imageNames 图标数组
 *  @param isLeft 是否是左边 非左即右
 *  @param target 目标 self
 *  @param action 按钮的点击方法
 */
- (void)setupNavigationItemWithImageNames:(NSArray *)imageNames isLeft:(BOOL)isLeft target:(id)target action:(SEL)action;

/**
 *  导航栏添加文本按钮
 *
 *  @param titles 文本数组
 *  @param isLeft 是否是左边 非左即右
 *  @param target 目标 self
 *  @param action 按钮的点击方法
 */
- (void)setupNavigationItemWithTitles:(NSArray *)titles isLeft:(BOOL)isLeft target:(id)target action:(SEL)action;

@end
