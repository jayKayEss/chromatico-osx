//
//  CCOAppDelegate.m
//  Chromatico
//
//  Created by Justin Sheckler on 4/13/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import "CCOAppDelegate.h"
#import "ChromaticoSaverView.h"
#import "CCOChromaticoView.h"

@implementation CCOAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSView *contentView = self.window.contentView;
    self.chromaticoView = [[ChromaticoSaverView alloc] initWithFrame:contentView.frame];
    [contentView addSubview:self.chromaticoView];
    NSLog(@"App did finish launching!");
    [self.chromaticoView startAnimation];
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
    [self.chromaticoView stopAnimation];
}

@end
