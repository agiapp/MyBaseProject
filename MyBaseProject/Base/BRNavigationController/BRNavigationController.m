//
//  BRNavigationController.m
//  MyBaseProject
//
//  Created by 任波 on 2018/5/29.
//  Copyright © 2018年 91renb. All rights reserved.
//

#import "BRNavigationController.h"

@interface BRNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@end

@implementation BRNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.设置导航栏背景颜色
    self.navigationBar.barTintColor = kBRThemeColor;
    //[self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar_bg2"] forBarMetrics:UIBarMetricsDefault];
    
    // 此行代码能将状态栏和导航栏字体颜色全体改变,只能是黑色或白色
    self.navigationBar.barStyle = UIBarStyleBlack;
    
    // 2.设置导航栏所有子视图（返回图片）的颜色
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    // 3.设置 title 颜色
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.navigationBar.backIndicatorImage = [UIImage new];
    
    // 将系统默认的返回按钮设置到导航栏可见区域外（防止与自定义的返回按钮重叠）
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -100) forBarMetrics:UIBarMetricsDefault];
    
    self.delegate = self;
    // 设置返回手势的代理
    self.interactivePopGestureRecognizer.delegate = self;
}

#pragma mark - 重写父类导航控制器的push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断非根视图控制器
    if (self.viewControllers.count > 0) {
        // 设置导航栏左上角的返回按钮 (非根控制器才需要设置返回按钮)
        // viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backButton];
        // 隐藏底部的工具条
        viewController.hidesBottomBarWhenPushed = YES;
    }
    // 执行跳转
    [super pushViewController:viewController animated:animated];
}

/**
 *  设置是否允许返回手势: 因为修改了系统的返回按钮，所以还需要设置手势事件
 *  手势识别对象会调用这个代理方法来决定手势是否有效
 *
 *  @return YES : 手势有效， NO : 手势无效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    // 当前导航控制器的子控制器有2个以上的时候,手势有效
    return self.childViewControllers.count > 1;
}

@end
