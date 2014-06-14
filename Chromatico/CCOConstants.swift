//
//  CCOConstants.swift
//  Chromatico
//
//  Created by Justin Sheckler on 6/14/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

import Foundation

@objc class CCOConstants {
    
    class func minColors() -> Int {
        return 2;
    }
    
    class func maxColors() -> Int {
        return 4;
    }

    class func allStrings() -> String[] {
        return [
            "||||||||||++++++++++||||||||||++++++++++\n++++++++++||||||||||++++++++++||||||||||\n||||||||||++++++++++||||||||||++++++++++\n++++++++++||||||||||++++++++++||||||||||",
            
            "& & & & & & & &",
            
            "* * * * * * * * *",
            
            "Ж",
            
            "Jackdaws\nlove my\nbig sphinx\nof quartz.",
            
            "Wafting\nzephyrs\nquickly\nvexed\nJumbo.",
            
            "!!!!\n!!!!\n????\n????\n!!!!\n!!!!\n????\n????\n!!!!\n!!!!",
            
            "“” „”  »«",
            
            "  \\ \\ \\ \\ \\ \\ \\ \\ \\ \\\n \\ \\ \\ \\ \\ \\ \\ \\ \\ \\\n      \\ \\ \\ \\ \\ \\ \\ \\ \\ \\\n       \\ \\ \\ \\ \\ \\ \\ \\ \\ \\\n    \\ \\ \\ \\ \\ \\ \\ \\ \\ \\\n     \\ \\ \\ \\ \\ \\ \\ \\ \\ \\\n",
            
            "}}}}} {{{{{",
            
            "1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1,597 2,584 4,181 6,765 10,946 17,711 28,657 46,368 75,025 121,393",
            
            "++++----++++----++++----++++----++++----++++----",
            
            "ETAOIN SHRDLU",
            "ETAOIN\nSHRDLU",
            
            "#",
            
            "Ñ",
            
            "@",
            
            "·-- ·- ··-· - ·· -· --·  --·· · ·--· ···· -·-- ·-· ···",
            
            "3",
            
            ">< <> >>",
            "*** *** *** ***",
            "** ** ** ** **",
            "* ** *** **** ***** ******",
            
            "((()))",
            "[[[]]]",
            
            "Ñ",
            "Y",
            "4",
            "###",
            "8",
            
            "å",
            "ß",
            "^",
            
            "?",
            "∂",
            "ƒ",
            "©",
            
            "Ø",
            "K",
            "Q",
            
            "0000 0001 0010 0011\n0100 0101 0110 0111\n1000 1001 1010 1011\n1100 1101 1110 1111"
        ];
    }
    
    class func getRandomString() -> String {
        let strings = self.allStrings()
        let n = CCORandom.rand(strings.count)
        return strings[n]
    }
    
    class func allFonts() -> String[] {
        return [
            "HelveticaNeue",
            "HelveticaNeue-Bold",
            "Times-Roman",
            "Times-Bold",
            "Courier",
            "Courier-Bold"
        ]
    }
    
    class func getRandomFont() -> String {
        let fonts = allFonts()
        let n = CCORandom.rand(fonts.count)
        return fonts[n]
    }
    
    class func getColorAnimationDuration() -> Float {
        return 5.0
    }
}
