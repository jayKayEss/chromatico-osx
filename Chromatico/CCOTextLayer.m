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
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.0];
    CGFloat fontSize = (CGFloat)(arc4random() % 400 + 48);
    CGFloat zPosition = (CGFloat)(arc4random() % 100);
    CGColorRef color = [[CCOPalette getInstance] grabColor];
    
    self.textLayer.string = [CCOConstants getRandomString];
    self.textLayer.font = CGFontCreateWithFontName(CFSTR("HelveticaNeue-Bold"));
    self.textLayer.fontSize = fontSize;
    self.textLayer.foregroundColor = color;
    self.textLayer.zPosition = zPosition;
    [self.textLayer adjustBoundsToFit];
    
    self.xPos = self.outerBounds.size.width + (self.layer.bounds.size.width / 2);
    self.yPos = (float)(arc4random() % (int)(self.outerBounds.size.height - 1) + 1);
    self.xFinal = 0 - (self.layer.bounds.size.width / 2);

    self.textLayer.position = CGPointMake(self.xPos, self.yPos);
    [CATransaction commit];
}

- (void)changeColor
{
    CCOPalette *palette = [CCOPalette getInstance];
    CGColorRef color = [palette grabColor];
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0];
    self.textLayer.foregroundColor = color;
    [CATransaction commit];
    
}

@end
