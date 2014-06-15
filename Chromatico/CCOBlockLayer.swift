//
//  CCOBlockLayer.swift
//  Chromatico
//
//  Created by Justin Sheckler on 6/14/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

import Foundation
import QuartzCore

class CCOBlockLayer: CCOLayer {
    
    var shapeLayer: CAShapeLayer!
    
    init(palette: CCOPalette!) {
        shapeLayer = CAShapeLayer()
        super.init(palette: palette, layer: shapeLayer)
    }

    override func setUpGeometry() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(CFTimeInterval(0))
        
        let outerWidth = CGFloat(CGRectGetWidth(outerBounds))
        let outerHeight = CGFloat(CGRectGetHeight(outerBounds))
        let color = palette.grabColor()
        
        let width = CGFloat(CCORandom.rand(Int(outerWidth/2))) + 1
        let rect = CGRectMake(0, 0, width, outerHeight)
        let path = CGPathCreateWithRect(rect, nil)
        
        let zPosition = CGFloat(CCORandom.rand(100))
        
        shapeLayer.path = path
        shapeLayer.fillColor = color
        shapeLayer.zPosition = zPosition
        
        xPos = outerWidth + width
        xFinal = 0 - width
        yPos = 0
        
        layer.position = CGPointMake(xPos, yPos)
        
        CATransaction.commit()
    }
    
    override func changeColor() {
        let color = palette.grabColor()
        let duration = CCOConstants.colorAnimationDuration
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(CFTimeInterval(duration))
        
        shapeLayer.fillColor = color
        
        CATransaction.commit()
    }
    
}