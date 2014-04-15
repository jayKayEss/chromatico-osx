//
//  CCOAppDelegate.m
//  Chromatico
//
//  Created by Justin Sheckler on 4/13/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import "CCOAppDelegate.h"
#import "ChromaticoSaverView.h"

@implementation CCOAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSView *contentView = self.window.contentView;
    self.chromaticoView = [[ChromaticoSaverView alloc] initWithFrame:contentView.frame];
    [contentView addSubview:self.chromaticoView];

    [self.chromaticoView startAnimation];
    
    // Mimic screensaver framework
    [NSTimer scheduledTimerWithTimeInterval:[self.chromaticoView animationTimeInterval]
                                     target:self.chromaticoView
                                   selector:@selector(animateOneFrame)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
    [self.chromaticoView stopAnimation];
}

@end
