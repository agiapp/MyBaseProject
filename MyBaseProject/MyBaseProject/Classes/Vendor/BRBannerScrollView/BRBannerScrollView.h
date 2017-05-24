//
//  BRBannerScrollView.h
//  AiBaoYun
//
//  Created by 任波 on 2017/5/23.
//  Copyright © 2017年 aby. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BRTapAcitonBlock)(NSInteger index);

@interface BRBannerScrollView : UIView

/** 图片点击回调 */
@property (nonatomic, copy) BRTapAcitonBlock tapAcitonBlock;

/**
 *  初始化方法
 *
 *  @param frame            位置
 *  @param dataSourceArr    本地图片名/网络图片url
 */
- (instancetype)initWithFrame:(CGRect)frame dataSourceArr:(NSArray *)dataSourceArr;

/**
 *  关闭定时器,关闭自动滚动
 */
- (void)stopTimer;

@end
