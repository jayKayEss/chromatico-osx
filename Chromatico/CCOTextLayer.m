//
//  CCOTextLayer.m
//  Chromatico
//
//  Created by Justin Sheckler on 4/13/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "CCOTextLayer.h"
#import "CCOConstants.h"
#import "CCOPalette.h"
#import "CATextLayer+AutoSizing.h"

@interface CCOTextLayer ()

@property CATextLayer *textLayer;

@end

@implementation CCOTextLayer

- (void)createLayer
{
    self.textLayer = [[CATextLayer alloc] init];
    self.layer = self.textLayer;
}

- (void)setUpGeometry
{
    CGFloat outerWidth = self.outerBounds.size.width;
    CGFloat outerHeight = self.outerBounds.size.height;
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.0];
    CGFloat fontSize = (CGFloat)arc4random_uniform(outerHeight) + (outerHeight / 7);
    CGFloat zPosition = (CGFloat)arc4random_uniform(100);
    CGColorRef color = [self.palette grabColor];
    NSString *fontName = [CCOConstants getRandomFont];

    self.textLayer.string = [CCOConstants getRandomString];
    self.textLayer.font = (CFStringRef)CFBridgingRetain(fontName);
    self.textLayer.fontSize = fontSize;
    self.textLayer.foregroundColor = color;
    self.textLayer.zPosition = zPosition;
    [self.textLayer adjustBoundsToFit];
    
    self.xPos = outerWidth + (self.layer.bounds.size.width / 2);
    self.yPos = (float)arc4random_uniform((int)self.outerBounds.size.height - 1) + 1.0;
    self.xFinal = 0 - (self.layer.bounds.size.width / 2);

    self.textLayer.position = CGPointMake(self.xPos, self.yPos);
    [CATransaction commit];
}

- (void)changeColor
{
    CGColorRef color = [self.palette grabColor];
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    self.textLayer.foregroundColor = color;
    [CATransaction commit];
    
}

@end
