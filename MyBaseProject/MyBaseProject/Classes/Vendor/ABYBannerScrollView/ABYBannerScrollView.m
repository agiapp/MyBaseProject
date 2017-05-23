//
//  ABYBannerScrollView.m
//  AiBaoYun
//
//  Created by 任波 on 2017/4/26.
//  Copyright © 2017年 aby. All rights reserved.
//

#import "ABYBannerScrollView.h"
#import "ABYWaterAnimation.h"
#import "UIImageView+BRAdd.h"

#define HEIGHT self.frame.size.height
#define IMAGE_COUNT self.imageNameArr.count

@interface ABYBannerScrollView ()<UIScrollViewDelegate>
{
    NSInteger _currentImageIndex;  //当前图片索引
    BOOL isDraging; // 是否有拖拽
}
/** 滚动视图 */
@property (nonatomic, strong) UIScrollView *scrollView;
/** 左边的视图 */
@property (nonatomic, strong) UIImageView *leftImageView;
/** 当前正在显示的视图 */
@property (nonatomic, strong) UIImageView *centerImageView;
/** 即将显示的视图 */
@property (nonatomic, strong) UIImageView *rightImageView;
/** 小圆点指示器 */
@property (nonatomic, strong) UIPageControl *pageControl;
/** 水波动画 */
@property (nonatomic, strong) ABYWaterAnimation *waterWave;
/** 图片数据源 */
@property (nonatomic, strong) NSArray *imageNameArr;
/** 定时器 */
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation ABYBannerScrollView

- (instancetype)initWithFrame:(CGRect)frame dataSourceArr:(NSArray *)dataSourceArr {
    if (self = [super init]) {
        self.frame = frame;
        self.imageNameArr = dataSourceArr;
        [self initUI];
        //加载默认图片
        [self setupDefaultImage];
        //开启定时器
        [self startTimer];
    }
    return self;
}

#pragma mark -- 设置默认显示图片
- (void)setupDefaultImage {
    [self setImageView:self.leftImageView imageName:[self.imageNameArr lastObject]];
    [self setImageView:self.centerImageView imageName:[self.imageNameArr firstObject]];
    [self setImageView:self.rightImageView imageName:[self.imageNameArr objectAtIndex:1]];
    
    _currentImageIndex = 0;
    //设置当前页
    self.pageControl.currentPage = _currentImageIndex;
    isDraging = NO;
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

- (void)initUI {
    //添加滚动控件
    [self addSubview:self.scrollView];
    [self.scrollView addSubview:self.leftImageView];
    [self.scrollView addSubview:self.centerImageView];
    [self.scrollView addSubview:self.rightImageView];
    [self addSubview:self.pageControl];
    [self addSubview:self.waterWave];
}

#pragma mark - 开启定时器
- (void)startTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        if (!isDraging) {
            [UIView animateWithDuration:1.0 animations:^{
                CGPoint offSet = _scrollView.contentOffset;
                offSet.x += SCREEN_WIDTH;
                _scrollView.contentOffset = offSet;
            } completion:^(BOOL finished) {
                [self reloadImage];
                [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:NO];
                //设置分页
                _pageControl.currentPage = _currentImageIndex;
            }];
        }
    }];
}

#pragma mark - 销毁定时器
- (void)stopTimer {
    if ([self.timer isValid]) {
        [self.timer invalidate]; // 销毁timer
        self.timer = nil;        // 置nil
    }
}

#pragma mark -- 添加scrollView
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HEIGHT)];
        //设置代理
        _scrollView.delegate = self;
        //设置contentSize
        _scrollView.contentSize = CGSizeMake(IMAGE_COUNT * SCREEN_WIDTH, HEIGHT);
        //设置当前显示的位置为中间图片
        [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:YES];
        //设置分页
        _scrollView.pagingEnabled = YES;
        //去掉滚动条
        _scrollView.showsHorizontalScrollIndicator = NO;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageClick:)];
        [_scrollView addGestureRecognizer:tap];
    }
    return _scrollView;
}

- (UIImageView *)leftImageView {
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HEIGHT)];
    }
    return _leftImageView;
}

- (UIImageView *)centerImageView {
    if (!_centerImageView) {
        _centerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, HEIGHT)];
    }
    return _centerImageView;
}

- (UIImageView *)rightImageView {
    if (!_rightImageView) {
        _rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(2 * SCREEN_WIDTH, 0, SCREEN_WIDTH, HEIGHT)];
    }
    return _rightImageView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init];
        //注意此方法可以根据页数返回UIPageControl合适的大小
        CGSize size = [_pageControl sizeForNumberOfPages:IMAGE_COUNT];
        _pageControl.bounds = CGRectMake(0, 0, size.width, size.height);
        _pageControl.center = CGPointMake(SCREEN_WIDTH / 2, HEIGHT - 20);
        //设置颜色
        _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:193 / 255.0 green:219 / 255.0 blue:249 / 255.0 alpha:0.5];
        //设置当前页颜色
        _pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:0 green:150 / 255.0 blue:1 alpha:1];
        //设置总页数
        _pageControl.numberOfPages = IMAGE_COUNT;
    }
    return _pageControl;
}

- (ABYWaterAnimation *)waterWave {
    if (!_waterWave) {
        //白色水波的frame
        _waterWave = [[ABYWaterAnimation alloc]initWithFrame:CGRectMake(0, HEIGHT - 20, SCREEN_WIDTH, 20)];
    }
    return _waterWave;
}

#pragma mark -- 图片点击的代理方法
- (void)imageClick:(UITapGestureRecognizer *)sender {
    if (self.tapAcitonBlock) {
        self.tapAcitonBlock(_currentImageIndex);
    }
}

#pragma mark -- 核心代码 - scrollView 代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self reloadImage];
    //移动到中间
    [_scrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:NO];
    //设置分页
    _pageControl.currentPage = _currentImageIndex;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    isDraging = YES;
    [self.waterWave startAnimation];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    isDraging = NO;
    [self.waterWave stopAnimation];
}

#pragma mark 重新加载图片
- (void)reloadImage {
    CGPoint offset = [_scrollView contentOffset];
    if (offset.x > SCREEN_WIDTH) { //向右滑动
        _currentImageIndex = (_currentImageIndex + 1) % IMAGE_COUNT;
    } else if (offset.x < SCREEN_WIDTH) { //向左滑动
        _currentImageIndex = (_currentImageIndex + IMAGE_COUNT - 1) % IMAGE_COUNT;
    }
    
    [self setImageView:self.centerImageView imageName:[self.imageNameArr objectAtIndex:_currentImageIndex]];
    // 重新设置左右图片
    NSInteger leftImageIndex = (_currentImageIndex + IMAGE_COUNT - 1) % IMAGE_COUNT;
    NSInteger rightImageIndex = (_currentImageIndex + 1) % IMAGE_COUNT;
    [self setImageView:self.leftImageView imageName:[self.imageNameArr objectAtIndex:leftImageIndex]];
    [self setImageView:self.rightImageView imageName:[self.imageNameArr objectAtIndex:rightImageIndex]];
}


@end
