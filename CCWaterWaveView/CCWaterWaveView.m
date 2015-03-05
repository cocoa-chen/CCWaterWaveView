//
//  CCWaterWaveView.m
//  CCWaterWaveView
//
//  Created by 陈爱彬 on 15/3/5.
//  Copyright (c) 2015年 陈爱彬. All rights reserved.
//

#import "CCWaterWaveView.h"

static CGFloat const minA = 0;
static CGFloat const maxA = 3;

@interface CCWaterWaveView()
{
    NSTimer *_animateTimer;
    CGFloat _width;
    CGFloat _height;
    CGFloat _offsetY;
    CGFloat a;
    CGFloat angle;
}
@end

@implementation CCWaterWaveView

- (void)dealloc
{
    NSLog(@"%s",__func__);
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
- (void)setup
{
    self.waterBackgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
    _waterColor = [UIColor blueColor];
    _width = CGRectGetWidth(self.frame);
    _height = CGRectGetHeight(self.frame);
    a = maxA;
    self.progress = 0.0;
    self.layer.cornerRadius = _width / 2;
    self.layer.masksToBounds = YES;
    //timer
    _animateTimer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(animateTimerTrigged) userInfo:nil repeats:YES];
    NSRunLoop *main=[NSRunLoop currentRunLoop];
    [main addTimer:_animateTimer forMode:NSRunLoopCommonModes];
}
- (void)setWaterBackgroundColor:(UIColor *)waterBackgroundColor
{
    _waterBackgroundColor = waterBackgroundColor;
    self.backgroundColor = _waterBackgroundColor;
}
- (void)setWaterColor:(UIColor *)waterColor
{
    _waterColor = waterColor;
    [self setNeedsDisplay];
}
- (void)setProgress:(CGFloat)progress
{
    if (progress > 1.f) {
        progress = 1.f;
    }
    if (progress < 0.f) {
        progress = 0.f;
    }
    _progress = progress;
    _offsetY = (1.0 - progress) * CGRectGetHeight(self.frame);
    [self setNeedsDisplay];
}
- (void)animateTimerTrigged
{
    if (a >= maxA) {
        a -= 0.1;
    }else if (a <= minA) {
        a += 0.1;
    }
    angle += 0.2;
    if (angle >= 360) {
        angle = 0;
    }
    [self setNeedsDisplay];
}
- (void)stopWaterWave
{
    [_animateTimer invalidate];
    _animateTimer = nil;
}
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1);
    CGContextSetFillColorWithColor(context, _waterColor.CGColor);
    //get path
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat y = _offsetY;
    CGPathMoveToPoint(path, nil, 0, y);
    for (CGFloat x = 0; x <= _width; x++) {
        y = a * sin(x * M_PI / 40 + angle / M_PI) + _offsetY;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    CGPathAddLineToPoint(path, nil, _width, _height);
    CGPathAddLineToPoint(path, nil, 0, _height);
    CGPathAddLineToPoint(path, nil, 0, _offsetY);
    
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(path);
}
@end
