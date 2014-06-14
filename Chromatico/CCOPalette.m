//
//  ChromaticoPalette.m
//  Chromatico
//
//  Created by Justin Sheckler on 4/12/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import "CCOPalette.h"
#import "CCOLayer.h"
#import "Chromatico-Swift.h"

@interface CCOPalette ()

@property int cursor;

@end

@implementation CCOPalette

- (CGColorRef)grabColor
{
    if (self.cursor >= [self.colors count]) {
        self.cursor = 0;
    }
    
    NSColor *color = self.colors[self.cursor++];
    return [color CGColor];
}

- (void)changeToNewColors
{
    int minColors = [CCOConstants minColors];
    int maxColors = [CCOConstants maxColors];
    int numColors = arc4random_uniform(maxColors - minColors + 1) + minColors;
    
    NSMutableArray *colors = [[NSMutableArray alloc] init];
    
    for (int i=0; i<numColors; i++) {
        NSColor *color = [NSColor randomColor];
        [colors addObject:color];
    }
    
    self.colors = colors;
}

@end
