//
//  CCOPalette.swift
//  Chromatico
//
//  Created by Justin Sheckler on 6/14/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

import Foundation

@objc class CCOPalette {
    
    var cursor: Int
    var colors: NSColor[]
    
    init() {
        cursor = 0;
        colors = [];
    }
    
    func grabColor() -> CGColorRef {
        if cursor >= colors.count {
            cursor = 0
        }
        
        let color = colors[cursor++]
        return color.CGColor
    }
    
    func changeToNewColors() {
        let minColors = CCOConstants.minColors()
        let maxColors = CCOConstants.maxColors()
        let numColors = CCORandom.rand(maxColors - minColors + 1) + minColors
        
        var newColors: NSColor[] = [];
        
        for (var i=0; i<numColors; i++) {
            let newColor = NSColor.randomColor()
            newColors.append(newColor)
        }
        
        colors = newColors
    }
    
}