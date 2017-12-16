//
//  BRBannerScrollView.m
//  AiBaoYun
//
//  Created by 任波 on 2017/5/23.
//  Copyright © 2017年 aby. All rights reserved.
//

#define HEIGHT self.frame.size.height
#define IMAGE_COUNT self.imageNameArr.count

#define leftRightMargin 12  //左右间距
#define topBottomMargin 24  //上下间距
#define minImageAlpha 0.9   //左右小图片蒙版的透明度

#import "BRBannerScrollView.h"

@class ABYGuideViewController;
@interface BRBannerScrollView ()<UIScrollViewDelegate>
{
    NSInteger _currentImageIndex;   //当前图片索引
    BOOL _isDragging;               // 是否有拖拽
    CGSize _pageSize;               //一页的尺寸
    NSInteger _orginPageCount;      //原始页数
    NSInteger _pageCount;           //总页数
    NSInteger _visibleLocation;         //可见的位置
    NSInteger _visibleLength;           //可见的长度
}

/** 滚动视图 */
@property (nonatomic, strong) UIScrollView *scrollView;
/** 图片视图 */
@property (nonatomic, strong) UIImageView *imageView;
/** 小圆点指示器 */
@property (nonatomic, strong) UIPageControl *pageControl;
/** 图片数据源 */
@property (nonatomic, strong) NSArray *imageNameArr;
/** 轮播项子视图数组 */
@property (nonatomic, strong) NSMutableArray *itemArr;
/** 可重用的轮播项子视图数组 */
@property (nonatomic, strong) NSMutableArray *reusableItemArr;
/** 定时器 */
@property (nonatomic, weak) NSTimer *timer;


@end

@implementation BRBannerScrollView

- (instancetype)initWithFrame:(CGRect)frame dataSourceArr:(NSArray *)dataSourceArr {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.imageNameArr = dataSourceArr;
        _orginPageCount = IMAGE_COUNT;
        [self initUI];
    }
    return self;
}

- (void)initUI {
    //添加滚动控件
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
}

- (void)layoutSubviews {
    [self reloadData];
}

#pragma mark -- 给ImageView赋值
- (void)setImageView:(UIImageView *)imageView imageName:(NSString *)imageName {
    if ([imageName hasPrefix:@"http"]) {
        // 下载网络图片并赋值
        [imageView br_setImageWithPath:imageName placeholder:nil];
    } else {
        imageView.image = [UIImage imageNamed:imageName];
    }
}

#pragma mark -- 添加scrollView
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        // 控制滚动到顶部手势的开关
        _scrollView.scrollsToTop = NO;
        //设置代理
        _scrollView.delegate = self;
        //设置contentSize
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, HEIGHT);
        //设置分页
        _scrollView.pagingEnabled = YES;
        _scrollView.clipsToBounds = NO;
        //去掉滚动条
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, HEIGHT - 40, SCREEN_WIDTH, 8)];
        //设置总页数
        _pageControl.numberOfPages = IMAGE_COUNT;
    }
    return _pageControl;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor whiteColor];
    }
    return _imageView;
}

#pragma mark - 开启定时器
- (void)startTimer {
    if (_orginPageCount > 1) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
            // 没有触摸图片时，自动轮播图片
            if (!_isDragging) {
                NSLog(@"定时器方法，下一页");
                _currentImageIndex++;
                [_scrollView setContentOffset:CGPointMake(_currentImageIndex * _pageSize.width, 0) animated:YES];
            }
        }];
    }
}

#pragma mark - 销毁定时器
- (void)stopTimer {
    if ([self.timer isValid]) {
        [self.timer invalidate]; // 销毁timer
        self.timer = nil;        // 置nil
    }
}

- (void)queueReusableCell:(UIView *)cell {
    [self.reusableItemArr addObject:cell];
}

- (void)removeCellAtIndex:(NSInteger)index {
    UIView *itemView = [self.itemArr objectAtIndex:index];
    if ((NSObject *)itemView == [NSNull null]) {
        return;
    }
    
    [self queueReusableCell:itemView];
    
    if (itemView.superview) {
        [itemView removeFromSuperview];
    }
    
    [self.itemArr replaceObjectAtIndex:index withObject:[NSNull null]];
}

- (void)refreshVisibleCellAppearance {
    
    if (minImageAlpha == 1.0) {
        return;//无需更新
    }
    
    CGFloat offset = _scrollView.contentOffset.x;
    for (NSInteger i = _visibleLocation; i < _visibleLocation + _visibleLength; i++) {
        UIImageView *itemImageView = [self.itemArr objectAtIndex:i];
        CGFloat origin = itemImageView.frame.origin.x;
        CGFloat delta = fabs(origin - offset);
        
        CGRect originCellFrame = CGRectMake(_pageSize.width * i, 0, _pageSize.width, _pageSize.height);
        if (delta < _pageSize.width) {
            if (delta < _pageSize.width / 2) {
                itemImageView.alpha = 1;
            } else {
                itemImageView.alpha = (delta / _pageSize.width) * minImageAlpha;
            }
            
            CGFloat leftRightInset = leftRightMargin * delta / _pageSize.width;
            CGFloat topBottomInset = topBottomMargin * delta / _pageSize.width + 10;
            
            itemImageView.layer.transform = CATransform3DMakeScale((_pageSize.width - leftRightInset * 2) / _pageSize.width, (_pageSize.height - topBottomInset * 2) / _pageSize.height, 1.0);
            itemImageView.frame = UIEdgeInsetsInsetRect(originCellFrame, UIEdgeInsetsMake(topBottomInset, leftRightInset, topBottomInset, leftRightInset));
            
        } else {
            itemImageView.alpha = minImageAlpha;
            
            itemImageView.layer.transform = CATransform3DMakeScale((_pageSize.width - leftRightMargin * 2) / _pageSize.width, (_pageSize.height - topBottomMargin * 2) / _pageSize.height, 1.0);
            itemImageView.frame = UIEdgeInsetsInsetRect(originCellFrame, UIEdgeInsetsMake(topBottomMargin + 10, leftRightMargin, topBottomMargin + 10, leftRightMargin));
        }
    }
}

- (void)setPageAtIndex:(NSInteger)pageIndex {
    NSParameterAssert(pageIndex >= 0 && pageIndex < self.itemArr.count);
    
    UIView *itemView = [self.itemArr objectAtIndex:pageIndex];
    
    if ((NSObject *)itemView == [NSNull null]) {
        
        UIImageView *itemImageView = (UIImageView *)[self dequeueReusableCell];
        if (!itemImageView) {
            itemImageView = [[UIImageView alloc] init];
            itemImageView.layer.cornerRadius = 4;
            itemImageView.layer.masksToBounds = YES;
        }
        
        NSInteger index = pageIndex % _orginPageCount;
        
        //itemImageView.image = [UIImage imageNamed:self.imageNameArr[index]];
        [self setImageView:itemImageView imageName:self.imageNameArr[index]];
        
        itemView = itemImageView;
        
        NSAssert(itemView!=nil, @"datasource must not return nil");
        [self.itemArr replaceObjectAtIndex:pageIndex withObject:itemView];
        
        itemView.userInteractionEnabled = YES;
        //添加点击手势
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleCellTapAction:)];
        [itemView addGestureRecognizer:singleTap];
        itemView.tag = pageIndex % _orginPageCount;
        
        itemView.frame = CGRectMake(_pageSize.width * pageIndex, 0, _pageSize.width, _pageSize.height);
        
        if (!itemView.superview) {
            [_scrollView addSubview:itemView];
        }
    }
}


- (void)setPagesAtContentOffset:(CGPoint)offset {
    //计算_visibleRange
    CGPoint startPoint = CGPointMake(offset.x - _scrollView.frame.origin.x, offset.y - _scrollView.frame.origin.y);
    CGPoint endPoint = CGPointMake(startPoint.x + self.bounds.size.width, startPoint.y + self.bounds.size.height);
    NSInteger startIndex = 0;
    for (int i =0; i < self.itemArr.count; i++) {
        if (_pageSize.width * (i +1) > startPoint.x) {
            startIndex = i;
            break;
        }
    }
    
    NSInteger endIndex = startIndex;
    for (NSInteger i = startIndex; i < self.itemArr.count; i++) {
        //如果都不超过则取最后一个
        if ((_pageSize.width * (i + 1) < endPoint.x && _pageSize.width * (i + 2) >= endPoint.x) || i + 2 == self.itemArr.count) {
            endIndex = i + 1;//i+2 是以个数，所以其index需要减去1
            break;
        }
    }
    
    //可见页分别向前向后扩展一个，提高效率
    startIndex = MAX(startIndex - 1, 0);
    endIndex = MIN(endIndex + 1, self.itemArr.count - 1);
    
    _visibleLocation = startIndex;
    _visibleLength = endIndex - startIndex + 1;
    
    for (NSInteger i = startIndex; i <= endIndex; i++) {
        [self setPageAtIndex:i];
    }
    
    for (int i = 0; i < startIndex; i ++) {
        [self removeCellAtIndex:i];
    }
    
    for (NSInteger i = endIndex + 1; i < self.itemArr.count; i ++) {
        [self removeCellAtIndex:i];
    }
    
}

#pragma mark 刷新视图
- (void)reloadData {
    //移除所有self.scrollView的子控件
    for (UIView *view in self.scrollView.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            [view removeFromSuperview];
        }
    }
    
    [self stopTimer];
    //如果需要重新加载数据，则需要清空相关数据全部重新加载
    
    //重置pageCount
    //原始页数
    _orginPageCount = self.imageNameArr.count;
    
    //总页数
    _pageCount = _orginPageCount == 1 ? 1: self.imageNameArr.count * 3;
    
    //如果总页数为0，return
    if (_pageCount == 0) {
        
        return;
    }
    
    //重置pageWidth
    _pageSize = CGSizeMake(self.bounds.size.width - 4 * leftRightMargin, (self.bounds.size.width - 4 * leftRightMargin) * 9 /16);
    
    [self.reusableItemArr removeAllObjects];
    
    _visibleLocation = 0;
    _visibleLength = 0;
    
    //填充cells数组
    [self.itemArr removeAllObjects];
    for (NSInteger index = 0; index < _pageCount; index++) {
        [self.itemArr addObject:[NSNull null]];
    }
    
    // 重置_scrollView的contentSize
    _scrollView.frame = CGRectMake(0, 0, _pageSize.width, _pageSize.height);
    _scrollView.contentSize = CGSizeMake(_pageSize.width * _pageCount, _pageSize.height);
    CGPoint theCenter = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    _scrollView.center = theCenter;
    
    if (_orginPageCount > 1) {
        //滚到第二组
        [_scrollView setContentOffset:CGPointMake(_pageSize.width * _orginPageCount, 0) animated:NO];
        _currentImageIndex = _orginPageCount;
        //启动自动轮播
        [self startTimer];
    }
    
    [self setPagesAtContentOffset:_scrollView.contentOffset];//根据当前scrollView的offset设置cell
    [self refreshVisibleCellAppearance];//更新各个可见Cell的显示外貌
}

//获取可重复使用的Cell
- (UIView *)dequeueReusableCell {
    UIImageView *itemImageView = [self.reusableItemArr lastObject];
    if (itemImageView) {
        [self.reusableItemArr removeLastObject];
    }
    
    return itemImageView;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_orginPageCount == 0) {
        return;
    }
    NSInteger pageIndex;
    
    pageIndex = (int)round(_scrollView.contentOffset.x / _pageSize.width) % _orginPageCount;
    
    if (_orginPageCount > 1) {
        if (scrollView.contentOffset.x / _pageSize.width >= 2 * _orginPageCount) {
            [scrollView setContentOffset:CGPointMake(_pageSize.width * _orginPageCount, 0) animated:NO];
            _currentImageIndex = _orginPageCount;
        }
        
        if (scrollView.contentOffset.x / _pageSize.width <= _orginPageCount - 1) {
            [scrollView setContentOffset:CGPointMake((2 * _orginPageCount - 1) * _pageSize.width, 0) animated:NO];
            _currentImageIndex = 2 * _orginPageCount;
        }
    } else {
        pageIndex = 0;
    }
    
    [self setPagesAtContentOffset:scrollView.contentOffset];
    [self refreshVisibleCellAppearance];
    
    if (self.pageControl && [self.pageControl respondsToSelector:@selector(setCurrentPage:)]) {
        [self.pageControl setCurrentPage:pageIndex];
    }
}

#pragma mark --将要开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _isDragging = YES;
}

#pragma mark --将要结束拖拽
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    _isDragging = NO;
}

//点击了cell
- (void)singleCellTapAction:(UITapGestureRecognizer *)sender {
    if (self.tapAcitonBlock) {
        self.tapAcitonBlock(sender.view.tag);
    }
}

- (NSMutableArray *)itemArr {
    if (!_itemArr) {
        _itemArr = [[NSMutableArray alloc]init];
    }
    return _itemArr;
}

- (NSMutableArray *)reusableItemArr {
    if (!_reusableItemArr) {
        _reusableItemArr = [[NSMutableArray alloc]init];
    }
    return _reusableItemArr;
}


@end
