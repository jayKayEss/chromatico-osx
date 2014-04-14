//
//  CCOAppDelegate.m
//  Chromatico
//
//  Created by Justin Sheckler on 4/13/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import "CCOAppDelegate.h"
#import "CCOChromaticoView.h"

@implementation CCOAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSLog(@"App did finish launching!");
    [self.chromaticoView startAnimation];
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
    [self.chromaticoView stopAnimation];
}

@end
