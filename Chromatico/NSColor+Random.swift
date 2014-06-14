//
//  NSColor+Random.swift
//  Chromatico
//
//  Created by Justin Sheckler on 6/14/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

import Foundation

extension NSColor {
    
    class func randomColor() -> NSColor {
        let hue = CGFloat(Float(CCORandom.rand(256)) / 256.0)
        let saturation = CGFloat(Float(arc4random_uniform(256)) / 256.0)
        let brightness = CGFloat(Float(arc4random_uniform(256)) / 256.0)
        
        return NSColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0);
    }
    
}
