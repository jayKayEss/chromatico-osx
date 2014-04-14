//
//  CCOLayer.m
//  Chromatico
//
//  Created by Justin Sheckler on 4/13/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "CCOLayer.h"

@implementation CCOLayer

- (id)init
{
    self = [super init];
    if (self) {
        self.shouldStopAnimation = NO;
        [self createLayer];
    }
    return self;
}

- (void)createLayer
{
    // subclasses should implement!
}

- (void)animate
{
    if (self.shouldStopAnimation == NO) {
        NSLog(@"Starting up layer animation");
        [self scheduleAnimation];
    } else {
        NSLog(@"Stopping layer animation");
    }
}

- (void)stopAnimation
{
    self.shouldStopAnimation = YES;
}

- (void)scheduleAnimation
{
//    float beginTime = (float)(arc4random() % 10);
//    NSLog(@"Scheduling animation in %f", beginTime);
//    
//    [NSTimer scheduledTimerWithTimeInterval:beginTime
//                                     target:self
//                                   selector:@selector(startAnimation)
//                                   userInfo:nil
//                                    repeats:NO];
    [self startAnimation];
}

- (void)setUpGeometry
{
    // subclasses should implement!
}

- (void)startAnimation
{
    [self setUpGeometry];
    CGFloat duration = (CGFloat)(arc4random() % 110) + 10;
//    CGFloat duration = (CGFloat)(arc4random() % 3) + 2;
//    NSLog(@"Animation duration %f", duration);
    
    CABasicAnimation* moveLeft = [CABasicAnimation animationWithKeyPath:@"position"];
    moveLeft.fromValue = [NSValue valueWithPoint:CGPointMake(self.xPos, self.yPos)];
    moveLeft.toValue = [NSValue valueWithPoint:CGPointMake(self.xFinal, self.yPos)];
    moveLeft.duration = duration;
    
    __weak CCOLayer *wSelf = self;
    
    self.layer.position = CGPointMake(self.xPos, self.yPos);
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        CCOLayer *self = wSelf;
//        NSLog(@"Animation did finish.");
        [self scheduleAnimation];
    }];
    [self.layer addAnimation:moveLeft forKey:@"position"];
    [CATransaction commit];
}

- (void)changeColor
{
    // subclasses should implement!
}

@end
