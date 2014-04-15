//
//  CCOLayer.h
//  Chromatico
//
//  Created by Justin Sheckler on 4/13/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CATextLayer;
@class CCOPalette;

@interface CCOLayer : NSObject

@property CCOPalette *palette;
@property CALayer *layer;
@property CGRect outerBounds;
@property CGFloat xPos;
@property CGFloat yPos;
@property CGFloat xFinal;

- (id)initWithPalette:(CCOPalette *)palette;
- (void)startAnimation;
- (void)stopAnimation;
- (void)changeColor;

@end
