//
//  CCOLayer.h
//  Chromatico
//
//  Created by Justin Sheckler on 4/13/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CATextLayer;

@interface CCOLayer : NSObject

@property CALayer *layer;
@property CGRect outerBounds;
@property CGFloat xPos;
@property CGFloat yPos;
@property CGFloat xFinal;
@property BOOL shouldStopAnimation;

- (void)animate;
- (void)scheduleAnimation;
- (void)setUpGeometry;
- (void)startAnimation;
- (void)stopAnimation;
- (void)changeColor;

@end
