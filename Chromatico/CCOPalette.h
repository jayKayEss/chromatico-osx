//
//  ChromaticoPalette.h
//  Chromatico
//
//  Created by Justin Sheckler on 4/12/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCOPalette : NSObject

@property NSMutableArray *colors;

- (CGColorRef)grabColor;
- (void)changeToNewColors;

@end
