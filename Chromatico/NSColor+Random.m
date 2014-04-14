//
//  NSColor+Random.m
//  ChromaticoEngine
//
//  Created by Justin Sheckler on 4/11/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import "NSColor+Random.h"

@implementation NSColor (Random)

+ (instancetype)randomColor
{
    CGFloat hue = ( arc4random_uniform(256) / 256.0 );
    CGFloat saturation = ( arc4random_uniform(256) / 256.0 );
    CGFloat brightness = ( arc4random_uniform(256) / 256.0 );
    
    NSColor *color = [NSColor colorWithHue:hue
                                saturation:saturation
                                brightness:brightness
                                     alpha:1];
    return color;
}

@end
