//
//  ABYBannerScrollView.h
//  AiBaoYun
//
//  Created by 任波 on 2017/4/26.
//  Copyright © 2017年 aby. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ABYTapAcitonBlock)(NSInteger index);

@interface ABYBannerScrollView : UIView

/** 图片点击回调 */
@property (nonatomic, copy) ABYTapAcitonBlock tapAcitonBlock;

/**
 *  初始化方法
 *
 *  @param frame            位置
 *  @param dataSourceArr    本地图片名/网络图片url
 */
- (instancetype)initWithFrame:(CGRect)frame dataSourceArr:(NSArray *)dataSourceArr;

/** 销毁定时器 */
- (void)stopTimer;

@end
