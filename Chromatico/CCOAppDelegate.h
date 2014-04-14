//
//  CCOAppDelegate.h
//  Chromatico
//
//  Created by Justin Sheckler on 4/13/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class CCOChromaticoView;

@interface CCOAppDelegate : NSObject <NSApplicationDelegate>

@property (unsafe_unretained) IBOutlet NSWindow *window;
@property (weak) IBOutlet CCOChromaticoView *chromaticoView;

@end
