//
//  ViewController.m
//  CCWaterWaveView
//
//  Created by 陈爱彬 on 15/3/5.
//  Copyright (c) 2015年 陈爱彬. All rights reserved.
//

#import "ViewController.h"
#import "CCWaterWaveView.h"

@interface ViewController ()
{
    CCWaterWaveView *waveView;
    CGFloat progress;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor purpleColor];
    //add view
    waveView = [[CCWaterWaveView alloc] initWithFrame:CGRectMake(140, 150, 60, 60)];
    waveView.progress = 0.4;
    [self.view addSubview:waveView];
    
//    [NSTimer scheduledTimerWithTimeInterval:2.f target:self selector:@selector(updateProgress) userInfo:nil repeats:YES];
}

- (void)updateProgress
{
//    progress += 0.2;
//    if (progress >= 1.f) {
//        progress = 1.f;
//    }
    waveView.progress = progress;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
