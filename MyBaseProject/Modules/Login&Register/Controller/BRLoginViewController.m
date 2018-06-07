//
//  BRLoginViewController.m
//  MyBaseProject
//
//  Created by 任波 on 2018/6/1.
//  Copyright © 2018年 91renb. All rights reserved.
//

#import "BRLoginViewController.h"

@interface BRLoginViewController ()
@property (nonatomic, strong) UIImageView *logoImageView;
//@property (nonatomic, strong) UIImageView *logoImageView;
//@property (nonatomic, strong) UIImageView *logoImageView;

@end

@implementation BRLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"登录";
}

- (UIImageView *)logoImageView {
    if (!_logoImageView) {
        _logoImageView = [[UIImageView alloc]init];
        _logoImageView.backgroundColor = [UIColor whiteColor];
    }
    return _logoImageView;
}

@end
