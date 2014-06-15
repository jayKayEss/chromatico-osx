//
//  CCOTextLayer.swift
//  Chromatico
//
//  Created by Justin Sheckler on 6/14/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

import Foundation
import QuartzCore

class CCOTextLayer: CCOLayer {
    
    var textLayer: CATextLayer!
    
    init(palette: CCOPalette!) {
        textLayer = CATextLayer()
        super.init(palette: palette, layer: textLayer)
    }
    
    override func setUpGeometry() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(CFTimeInterval(0.0))
        
        let outerWidth = CGFloat(CGRectGetWidth(outerBounds))
        let outerHeight = CGFloat(CGRectGetHeight(outerBounds))
        
        let fontSize = CGFloat(CCORandom.rand(Int(outerHeight)) + (Int(outerHeight) / 10))
        
        let color = palette.grabColor()
        let zPosition = CGFloat(CCORandom.rand(100) + 100)

        textLayer.string = CCOConstants.getRandomString()
        textLayer.font = CCOConstants.getRandomFont()
        textLayer.fontSize = fontSize
        textLayer.foregroundColor = color
        textLayer.zPosition = zPosition
        
        // sets layer origin to middle point
        textLayer.adjustBoundsToFit()
        let innerWidth = CGFloat(CGRectGetWidth(self.layer.bounds))
        
        xPos = outerWidth + innerWidth / 2
        yPos = CGFloat(CCORandom.rand(Int(outerHeight)))
        xFinal = 0 - (innerWidth / 2)
        
        textLayer.position = CGPointMake(xPos, yPos)
        
        CATransaction.commit()
    }
    
}