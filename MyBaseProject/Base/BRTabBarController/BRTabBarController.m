//
//  BRTabBarController.m
//  MyBaseProject
//
//  Created by 任波 on 2018/5/29.
//  Copyright © 2018年 91renb. All rights reserved.
//

#import "BRTabBarController.h"

@interface BRTabBarController ()<UITabBarControllerDelegate>
@property (nonatomic, strong) NSMutableArray *controllers; //tabbar root VC

@end

@implementation BRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self setupUI];
    
}

- (void)setupUI {
    // 初始化tabbar
    [self setupTabBar];
    // 添加子控制器
    [self setupAllChildViewController];
}

#pragma mark - 初始化TabBar
- (void)setupTabBar{
    //设置背景色 去掉分割线
    [self setValue:[XYTabBar new] forKey:@"tabBar"];
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setBackgroundImage:[UIImage new]];
    //通过这两个参数来调整badge位置
    //    [self.tabBar setTabIconWidth:29];
    //    [self.tabBar setBadgeTop:9];
}


#pragma mark - 初始化VC
- (void)setupAllChildViewController {
    UIViewController *homeVC = [[UIViewController alloc]init];
    [self setupChildViewController:homeVC title:@"首页" imageName:@"icon_tabbar_homepage" selectImageName:@"icon_tabbar_homepage_selected"];
    
    UIViewController *makeFriendVC = [[UIViewController alloc]init];
    [self setupChildViewController:makeFriendVC title:@"Demo" imageName:@"icon_tabbar_onsite" selectImageName:@"icon_tabbar_onsite_selected"];
    
    UIViewController *msgVC = [UIViewController new];
    [self setupChildViewController:msgVC title:@"消息" imageName:@"icon_tabbar_merchant_normal" selectImageName:@"icon_tabbar_merchant_selected"];
    
    UIViewController *mineVC = [[UIViewController alloc]init];
    [self setupChildViewController:mineVC title:@"我的" imageName:@"icon_tabbar_mine" selectImageName:@"icon_tabbar_mine_selected"];
    
    self.viewControllers = self.controllers;
}

- (void)setupChildViewController:(UIViewController *)controller title:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName {
    controller.title = title;
    controller.tabBarItem.title = title;//跟上面一样效果
    controller.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //未选中字体颜色
    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:KBlackColor,NSFontAttributeName:SYSTEMFONT(10.0f)} forState:UIControlStateNormal];
    
    //选中字体颜色
    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:CNavBgColor,NSFontAttributeName:SYSTEMFONT(10.0f)} forState:UIControlStateSelected];
    //包装导航控制器
    RootNavigationController *nav = [[RootNavigationController alloc]initWithRootViewController:controller];
    
    //    [self addChildViewController:nav];
    [self.controllers addObject:nav];
    
}


-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    //    NSLog(@"选中 %ld",tabBarController.selectedIndex);
    
}

-(void)setRedDotWithIndex:(NSInteger)index isShow:(BOOL)isShow{
    if (isShow) {
        [self.tabBar setBadgeStyle:kCustomBadgeStyleRedDot value:0 atIndex:index];
    }else{
        [self.tabBar setBadgeStyle:kCustomBadgeStyleNone value:0 atIndex:index];
    }
    
}

- (BOOL)shouldAutorotate {
    return [self.selectedViewController shouldAutorotate];
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return [self.selectedViewController supportedInterfaceOrientations];
}

- (NSMutableArray *)controllers {
    if (!_controllers) {
        _controllers = [NSMutableArray array];
    }
    return _controllers;
}

@end
