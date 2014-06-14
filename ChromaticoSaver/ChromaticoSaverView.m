//
//  ChromaticoSaverView.m
//  ChromaticoSaver
//
//  Created by Justin Sheckler on 4/13/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "ChromaticoSaverView.h"
#import "CCOConstants.h"
#import "CCOPalette.h"
#import "CCOLayer.h"
#import "CCOBlockLayer.h"
#import "CCOTextLayer.h"
#import "CCOStripeLayer.h"

@interface ChromaticoSaverView ()

@property CALayer *hostedLayer;
@property NSMutableArray *layers;
@property CCOPalette *palette;
@property NSTimer *paletteTimer;

@end

@implementation ChromaticoSaverView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        self.palette = [[CCOPalette alloc] init];
        [self.palette changeToNewColors];
        
        // Disable runloop; we don't need it and it eats up power
        [self setAnimationTimeInterval:HUGE_VALF];
        
        [self setWantsLayer:YES];
        self.hostedLayer = [CALayer layer];
        self.hostedLayer.backgroundColor = [self.palette grabColor];
        [self setLayer:self.hostedLayer];
        
        self.layers = [[NSMutableArray alloc] init];
        
        for (int i=0; i<3; i++) {
            CCOBlockLayer *layer = [[CCOBlockLayer alloc] initWithPalette:self.palette];
            [self addCCOLayer:layer];
        }
        
        for (int i=0; i<3; i++) {
            CCOStripeLayer *layer = [[CCOStripeLayer alloc] initWithPalette:self.palette];
            [self addCCOLayer:layer];
        }
        
        for (int i=0; i<5; i++) {
            CCOTextLayer *layer = [[CCOTextLayer alloc] initWithPalette:self.palette];
            [self addCCOLayer:layer];
        }
    }
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
    [super startAnimation];
    
    for (CCOTextLayer *layer in self.layers) {
        [layer startAnimation];
    }
    
    if ([self.paletteTimer isValid]) {
        [self.paletteTimer invalidate];
    }
    
    self.paletteTimer = [NSTimer scheduledTimerWithTimeInterval:60
                                                         target:self
                                                       selector:@selector(changePalette)
                                                       userInfo:nil
                                                        repeats:YES];
}

- (void)stopAnimation
{
    [super stopAnimation];

    for (CCOLayer *layer in self.layers) {
        [layer stopAnimation];
    }
    
    [self.paletteTimer invalidate];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{

}

- (void)changePalette
{
    [self.palette changeToNewColors];
    float duration = [CCOConstants getColorAnimationDuration];

    CGColorRef color = [self.palette grabColor];
    [CATransaction begin];
    [CATransaction setAnimationDuration:duration];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    self.layer.backgroundColor = color;
    [CATransaction commit];
    
    for (CCOLayer *layer in self.layers) {
        [layer changeColor];
    }
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
