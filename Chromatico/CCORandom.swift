//
//  CCORandom.swift
//  Chromatico
//
//  Created by Justin Sheckler on 6/14/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

import Foundation

class CCORandom {
    
    class func rand(n: Int) -> Int {
        return Int(arc4random_uniform(CUnsignedInt(n)));
    }
    
}