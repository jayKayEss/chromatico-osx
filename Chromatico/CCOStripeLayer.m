//
//  CCOStripLayer.m
//  Chromatico
//
//  Created by Justin Sheckler on 4/13/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "CCOStripeLayer.h"
#import "CCOConstants.h"
#import "CCOPalette.h"

@interface CCOStripeLayer ()

@property CAShapeLayer *shapeLayer;

@end

@implementation CCOStripeLayer

- (void)createLayer
{
    self.shapeLayer = [[CAShapeLayer alloc] init];
    self.layer = self.shapeLayer;
}

- (void)setUpGeometry
{
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.0];
    
    CGFloat outerWidth = self.outerBounds.size.width;
    CGFloat outerHeight = self.outerBounds.size.height;
    
    CGColorRef color = [self.palette grabColor];
    CGFloat zPosition = (CGFloat)arc4random_uniform(100);
    
    CGFloat width = (float)arc4random_uniform((int)outerWidth * 2) + outerWidth;
    CGFloat height = (float)arc4random_uniform((int)outerHeight / 4) + 1;
    CGRect rect = CGRectMake(0, 0, width, height);
    CGPathRef path = CGPathCreateWithRect(rect, nil);
    
    self.shapeLayer.path = path;
    self.shapeLayer.fillColor = color;
    self.shapeLayer.zPosition = zPosition;
    
    self.xPos = outerWidth + width;
    self.xFinal = 0 - width;
    self.yPos = (float)arc4random_uniform((int)outerHeight - 1) + 1;
    
    self.layer.position = CGPointMake(self.xPos, self.yPos);
    [CATransaction commit];
}

- (void)changeColor
{
    CGColorRef color = [self.palette grabColor];
    float duration = [CCOConstants getColorAnimationDuration];
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:duration];
    self.shapeLayer.fillColor = color;
    [CATransaction commit];
    
}

@end
