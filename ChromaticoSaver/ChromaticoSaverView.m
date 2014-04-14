//
//  ChromaticoSaverView.m
//  ChromaticoSaver
//
//  Created by Justin Sheckler on 4/13/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import "ChromaticoSaverView.h"
#import "CCOChromaticoView.h"

@interface ChromaticoSaverView ()

@property CCOChromaticoView *chromaticoView;

@end

@implementation ChromaticoSaverView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:HUGE_VALF];
        self.chromaticoView = [[CCOChromaticoView alloc] initWithFrame:self.frame];
        [self addSubview:self.chromaticoView];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
    [self.chromaticoView startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
    [self.chromaticoView stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    return;
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
