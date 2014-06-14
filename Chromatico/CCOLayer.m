//
//  CCOLayer.m
//  Chromatico
//
//  Created by Justin Sheckler on 4/13/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "CCOLayer.h"
#import "Chromatico-Swift.h"

@interface CCOLayer ()

@property BOOL shouldContinueAnimation;

@end

@implementation CCOLayer

- (id)initWithPalette:(CCOPalette *)palette
{
    self = [super init];
    if (self) {
        self.palette = palette;
        self.shouldContinueAnimation = NO;
        [self createLayer];
    }
    return self;
}

- (void)createLayer
{
    // subclasses should implement!
}

- (void)startAnimation
{
    self.shouldContinueAnimation = YES;
    [self animate];
}

- (void)stopAnimation
{
    self.shouldContinueAnimation = NO;
}

- (void)setUpGeometry
{
    // subclasses should implement!
}

- (void)animate
{
    [self setUpGeometry];
    CGFloat duration = (CGFloat)(arc4random_uniform(110) + 10);
    
    CABasicAnimation* moveLeft = [CABasicAnimation animationWithKeyPath:@"position"];
    moveLeft.fromValue = [NSValue valueWithPoint:CGPointMake(self.xPos, self.yPos)];
    moveLeft.toValue = [NSValue valueWithPoint:CGPointMake(self.xFinal, self.yPos)];
    moveLeft.duration = duration;
    
    __weak CCOLayer *wSelf = self;
    
    self.layer.position = CGPointMake(self.xPos, self.yPos);
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        CCOLayer *self = wSelf;
        if (self.shouldContinueAnimation) {
            [self animate];
        }
    }];
    [self.layer addAnimation:moveLeft forKey:@"position"];
    [CATransaction commit];
}

- (void)changeColor
{
    // subclasses should implement!
}

@end
