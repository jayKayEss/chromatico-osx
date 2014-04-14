//
//  CCOBlockLayer.m
//  Chromatico
//
//  Created by Justin Sheckler on 4/13/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "CCOBlockLayer.h"
#import "CCOConstants.h"
#import "CCOPalette.h"

@interface CCOBlockLayer ()

@property CAShapeLayer *shapeLayer;

@end

@implementation CCOBlockLayer

- (void)createLayer
{
    self.shapeLayer = [[CAShapeLayer alloc] init];
    self.layer = self.shapeLayer;
}

- (void)setUpGeometry
{
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.0];
    
    CGColorRef color = [[CCOPalette getInstance] grabColor];

    CGFloat width = (float)arc4random_uniform((int)self.outerBounds.size.width / 2) + 1.0;
    CGRect rect = CGRectMake(0, 0, width, self.outerBounds.size.height);
    CGPathRef path = CGPathCreateWithRect(rect, nil);
    
    self.shapeLayer.path = path;
    self.shapeLayer.fillColor = color;
    
    self.xPos = self.outerBounds.size.width + width;
    self.xFinal = 0 - width;
    self.yPos = 0;
    
    self.layer.position = CGPointMake(self.xPos, self.yPos);
    [CATransaction commit];
}

- (void)changeColor
{
    CCOPalette *palette = [CCOPalette getInstance];
    CGColorRef color = [palette grabColor];
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0];
    self.shapeLayer.fillColor = color;
    [CATransaction commit];
    
}

@end
