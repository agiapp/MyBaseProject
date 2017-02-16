//
//  NSObject+HUD.h
//  MyBaseProject
//
//  Created by 任波 on 16/12/13.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>

@interface NSObject (HUD)
/** 弹出文字提示 */
- (void)showAlert:(NSString *)text;
/** 显示忙 */
- (void)showBusy;
/** 隐藏提示 */
- (void)hideProgress;

@end
