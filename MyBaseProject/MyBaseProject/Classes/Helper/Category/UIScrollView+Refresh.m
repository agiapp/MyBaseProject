//
//  UIScrollView+Refresh.m
//  MyBaseProject
//
//  Created by 任波 on 16/12/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UIScrollView+Refresh.h"

@implementation UIScrollView (Refresh)
/** 添加头部刷新 */
- (void)addHeaderRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock {
    self.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:refreshBlock];
}
/** 开始头部刷新 */
- (void)beginHeaderRefresh {
    [self.mj_header beginRefreshing];
}
/** 结束头部刷新 */
- (void)endHeaderRefresh {
    [self.mj_header endRefreshing];
}

/** 添加脚部刷新 */
- (void)addFooterRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock {
    self.mj_footer=[MJRefreshAutoFooter footerWithRefreshingBlock:refreshBlock];
}
/** 开始脚部刷新 */
- (void)beginFooterRefresh {
    [self.mj_footer beginRefreshing];
}
/** 结束脚部刷新 */
- (void)endFooterRefresh {
    [self.mj_footer endRefreshing];
}

@end
