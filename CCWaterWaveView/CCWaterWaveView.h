//
//  CCWaterWaveView.h
//  CCWaterWaveView
//
//  Created by 陈爱彬 on 15/3/5.
//  Copyright (c) 2015年 陈爱彬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCWaterWaveView : UIView

@property (nonatomic,strong) UIColor *waterBackgroundColor;
@property (nonatomic,strong) UIColor *waterColor;
@property (nonatomic) CGFloat progress;

//use this to stop timer and animation
- (void)stopWaterWave;

@end
