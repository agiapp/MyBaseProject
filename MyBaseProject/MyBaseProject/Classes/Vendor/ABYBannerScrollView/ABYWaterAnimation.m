//
//  ABYWaterAnimation.m
//  AiBaoYun
//
//  Created by 任波 on 2017/4/26.
//  Copyright © 2017年 aby. All rights reserved.
//

#import "ABYWaterAnimation.h"

#define WaterColor [UIColor whiteColor]

@interface ABYWaterAnimation ()
{
    UIColor *_currentWaterColor;
    UIImageView *_backImage;
    NSTimer *_timer;
    
    CGFloat _currentLinePointY;
    CGFloat _a;
    CGFloat _b;
    
    BOOL isChange;
    BOOL isPlaying;
}

@end

@implementation ABYWaterAnimation
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _a = 0;
        _b = 0;
        isChange = NO;
        isPlaying = NO;
        self.backgroundColor = [UIColor clearColor];
        _currentWaterColor = WaterColor;
        _currentLinePointY = 10;
        
    }
    return self;
}

- (void)startAnimation {
    if (isPlaying) {
        return;
    }
    _a = 1.5;
    _b = 0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(animationWave) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode: UITrackingRunLoopMode];
    isPlaying = YES;
}

- (void)stopAnimation {
    [_timer invalidate];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self  selector:@selector(stopTime) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode: UITrackingRunLoopMode];
    [self setNeedsDisplay];
}

/** 动画波动起伏 */
- (void)animationWave {
    if (isChange) {
        _a += 0.01;
    } else {
        _a -= 0.01;
    }
    if (_a <= 1) {
        isChange = YES;
    }
    if (_a >= 1.5) {
        isChange = NO;
    }
    _b += 0.1;
    [self setNeedsDisplay];
}

- (void)stopTime {
    _a -= 0.01;
    _b += 0.1;
    if (_a <= 0) {
        isPlaying = NO;
        [_timer invalidate];
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    //画水
    CGContextSetLineWidth(context, 1);
    CGContextSetFillColorWithColor(context, [_currentWaterColor CGColor]);
    float y=_currentLinePointY;
    CGPathMoveToPoint(path, NULL, 0, y);
    
    for(float x = 0; x <= self.bounds.size.width; x++){
        y= _a * sin(x / 180 * M_PI + 4 * _b / M_PI) * 5 + _currentLinePointY;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    CGPathAddLineToPoint(path, nil, self.bounds.size.width, _currentLinePointY+20);
    CGPathAddLineToPoint(path, nil, 0, _currentLinePointY+20);
    CGPathAddLineToPoint(path, nil, 0, _currentLinePointY);
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(path);
}


@end
