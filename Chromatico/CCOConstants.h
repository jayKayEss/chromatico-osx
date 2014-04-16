//
//  CCOConstants.h
//  Chromatico
//
//  Created by Justin Sheckler on 4/13/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCOConstants : NSObject

+ (NSArray *)strings;
+ (NSString *)getRandomString;
+ (NSArray *)fonts;
+ (NSString *)getRandomFont;
+ (int)minColors;
+ (int)maxColors;
+ (float)getColorAnimationDuration;

@end
