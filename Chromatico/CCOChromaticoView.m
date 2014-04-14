//
//  JKSAnimView.m
//  LayerFun
//
//  Created by Justin Sheckler on 4/13/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import "CCOChromaticoView.h"
#import <QuartzCore/QuartzCore.h>
#import "CCOPalette.h"
#import "CCOLayer.h"
#import "CCOBlockLayer.h"
#import "CCOTextLayer.h"
#import "CCOStripeLayer.h"

@interface CCOChromaticoView ()

@property NSMutableArray *layers;
@property NSTimer *colorChangeTimer;

@end

@implementation CCOChromaticoView

- (id)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        [self setWantsLayer:YES];
        CALayer* hostedLayer = [CALayer layer];
        hostedLayer.backgroundColor = [[CCOPalette getInstance] grabColor];
        [self setLayer:hostedLayer];
        
        self.layers = [[NSMutableArray alloc] init];

        for (int i=0; i<5; i++) {
            CCOBlockLayer *layer = [[CCOBlockLayer alloc] init];
            [self addCCOLayer:layer];
        }

        for (int i=0; i<3; i++) {
            CCOStripeLayer *layer = [[CCOStripeLayer alloc] init];
            [self addCCOLayer:layer];
        }

        for (int i=0; i<5; i++) {
            CCOTextLayer *layer = [[CCOTextLayer alloc] init];
            [self addCCOLayer:layer];
        }
    }
    NSLog(@"View is init!");
    return self;
}

- (void)addCCOLayer:(CCOLayer *)layer
{
    layer.outerBounds = self.layer.bounds;
    [self.layer addSublayer:layer.layer];
    [self.layers addObject:layer];
}

- (void)startAnimation
{
    NSLog(@"Starting animations");
    for (CCOTextLayer *layer in self.layers) {
        [layer animate];
    }
 
    [NSTimer scheduledTimerWithTimeInterval:60
                                     target:self
                                   selector:@selector(changeColors)
                                   userInfo:nil
                                    repeats:YES];
    
    [self setNeedsDisplay:YES];
}

- (void)stopAnimation
{
    [self.colorChangeTimer invalidate];
    for (CCOTextLayer *layer in self.layers) {
        [layer stopAnimation];
    }
}

- (void)changeColors
{
    NSLog(@"*** CHANGING COLORS ***");
    CCOPalette *palette = [CCOPalette getInstance];
    [palette changeToNewColors];
    
    CGColorRef color = [palette grabColor];
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0];
    self.layer.backgroundColor = color;
    [CATransaction commit];
    
    for (CCOTextLayer *layer in self.layers) {
        [layer changeColor];
    }
}

@end
