//
//  CCOAppDelegate.h
//  Chromatico
//
//  Created by Justin Sheckler on 4/13/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ChromaticoSaverView;

@interface CCOAppDelegate : NSObject <NSApplicationDelegate>

@property (unsafe_unretained) IBOutlet NSWindow *window;
@property ChromaticoSaverView *chromaticoView;

@end
