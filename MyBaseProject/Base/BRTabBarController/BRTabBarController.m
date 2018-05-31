//
//  BRTabBarController.m
//  MyBaseProject
//
//  Created by 任波 on 2018/5/29.
//  Copyright © 2018年 91renb. All rights reserved.
//

#import "BRTabBarController.h"
#import "BRNavigationController.h"

@interface BRTabBarController ()<UITabBarControllerDelegate>
//@property (nonatomic, strong) NSMutableArray *controllers; //tabbar root VC

@end

@implementation BRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.barTintColor = [UIColor whiteColor];
    // 未选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor], NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
    // 选中字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:kBRThemeColor, NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateSelected];
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
- (void)setupTabBar {
    // 设置背景色 去掉分割线
    // [self setValue:[XYTabBar new] forKey:@"tabBar"];
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setBackgroundImage:[UIImage new]];
}

#pragma mark - 初始化VC
- (void)setupAllChildViewController {
    UIViewController *homeVC = [[UIViewController alloc]init];
    [self setupChildViewController:homeVC title:@"首页" imageName:@"icon_tabbar_homepage" selectImageName:@"icon_tabbar_homepage_selected"];
    
    UIViewController *makeFriendVC = [[UIViewController alloc]init];
    [self setupChildViewController:makeFriendVC title:@"分类" imageName:@"icon_tabbar_onsite" selectImageName:@"icon_tabbar_onsite_selected"];
    
    UIViewController *msgVC = [UIViewController new];
    [self setupChildViewController:msgVC title:@"消息" imageName:@"icon_tabbar_merchant_normal" selectImageName:@"icon_tabbar_merchant_selected"];
    
    UIViewController *mineVC = [[UIViewController alloc]init];
    [self setupChildViewController:mineVC title:@"我的" imageName:@"icon_tabbar_mine" selectImageName:@"icon_tabbar_mine_selected"];
}

- (void)setupChildViewController:(UIViewController *)viewController title:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName {
    viewController.title = title;
    viewController.tabBarItem.title = title;
    // 显示原图，避免被系统渲染成蓝色
    viewController.tabBarItem.image = [UIImage br_originalImage:imageName];
    viewController.tabBarItem.selectedImage = [UIImage br_originalImage:selectImageName];
    // viewController.tabBarItem.badgeValue = @"100";
    // 数字、小红点、文字
    viewController.tabBarItem.badgeValue = @"5";
    // 包装导航控制器
    BRNavigationController *nav = [[BRNavigationController alloc]initWithRootViewController:viewController];
    [self addChildViewController:nav];
}

#pragma mark - UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"选中 %ld", tabBarController.selectedIndex);
}

// 拦截tabbar跳转
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    // [viewController.tabBarItem.title isEqualToString:@"分类"]
    if (viewController == self.childViewControllers[1]) {
        // 如果当前未登录，先去登录，再调整到当前viewController
//        return [BSVisitorHelper actionRequireLoginWithCompletionBlock:^{
//            [tabBarController setSelectedViewController:viewController];
//        }];
    }
    return YES;
}


@end
