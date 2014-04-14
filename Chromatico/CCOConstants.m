//
//  CCOConstants.m
//  Chromatico
//
//  Created by Justin Sheckler on 4/13/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

#import "CCOConstants.h"

@interface CCOConstants () {
    NSArray *strings;
}

@end

@implementation CCOConstants

+ (int)minColors
{
    return 2;
}

+ (int)maxColors
{
    return 4;
}

+ (NSArray *)strings
{
    static NSArray *strings;
    
    if (!strings) {
        strings = @[
             @"||||||||||++++++++++||||||||||++++++++++\n++++++++++||||||||||++++++++++||||||||||\n||||||||||++++++++++||||||||||++++++++++\n++++++++++||||||||||++++++++++||||||||||",
             
             @"& & & & & & & &",
             
             @"* * * * * * * * *",
             
             @"Ж",
             
             @"Jackdaws\nlove my\nbig sphinx\nof quartz.",
             
             @"Wafting\nzephyrs\nquickly\nvexed\nJumbo.",
             
             @"!!!!\n!!!!\n????\n????\n!!!!\n!!!!\n????\n????\n!!!!\n!!!!",
             
             @"“” „”  »«",
             
             @"  \\ \\ \\ \\ \\ \\ \\ \\ \\ \\\n \\ \\ \\ \\ \\ \\ \\ \\ \\ \\\n      \\ \\ \\ \\ \\ \\ \\ \\ \\ \\\n       \\ \\ \\ \\ \\ \\ \\ \\ \\ \\\n    \\ \\ \\ \\ \\ \\ \\ \\ \\ \\\n     \\ \\ \\ \\ \\ \\ \\ \\ \\ \\\n",
             
             @"}}}}} {{{{{",
             
             @"1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1,597 2,584 4,181 6,765 10,946 17,711 28,657 46,368 75,025 121,393",
             
             @"++++----++++----++++----++++----++++----++++----",
             
             @"ETAOIN SHRDLU",
             @"ETAOIN\nSHRDLU",
             
             @"#",
             
             @"Ñ",
             
             @"@",
             
             @"·-- ·- ··-· - ·· -· --·  --·· · ·--· ···· -·-- ·-· ···",
             
             @"3",
             
             @">< <> >>",
             @"*** *** *** ***",
             @"** ** ** ** **",
             @"* ** *** **** ***** ******",
             
             @"((()))",
             @"[[[]]]",
             
             @"Ñ",
             @"Y",
             @"4",
             @"###",
             @"8",
             
             @"å",
             @"ß",
             @"^",
             
             @"?",
             @"∂",
             @"ƒ",
             @"©",
             
             @"Ø",
             @"K",
             @"Q",
             
             @"0000 0001 0010 0011\n0100 0101 0110 0111\n1000 1001 1010 1011\n1100 1101 1110 1111"
             ];
    }
    
    return strings;
}

+ (NSString *)getRandomString
{
    NSArray *strings = [CCOConstants strings];
    int n = arc4random() % [strings count];
    return strings[n];
}

@end
