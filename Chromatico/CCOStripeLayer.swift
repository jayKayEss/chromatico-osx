//
//  CCOStripeLayer.swift
//  Chromatico
//
//  Created by Justin Sheckler on 6/14/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

import Foundation
import QuartzCore

class CCOStripeLayer: CCOLayer {
    
    var shapeLayer: CAShapeLayer
    
    init(palette: CCOPalette!) {
        shapeLayer = CAShapeLayer()
        super.init(palette: palette, layer: shapeLayer)
    }
    
    override func setUpGeometry() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(CFTimeInterval(0.0))
        
        let outerWidth = CGFloat(CGRectGetWidth(outerBounds))
        let outerHeight = CGFloat(CGRectGetHeight(outerBounds))
        
        let color = palette.grabColor()
        let zPosition = CGFloat(CCORandom.rand(100))
        
        let width = CGFloat(CCORandom.rand(Int(outerWidth)*2)) + outerWidth
        let height = CGFloat(CCORandom.rand(Int(outerHeight)/4)) + 1
        
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        let path = CGPathCreateWithRect(rect, nil)
        
        shapeLayer.path = path
        shapeLayer.fillColor = color
        shapeLayer.zPosition = zPosition
        
        xPos = outerWidth + width
        xFinal = 0 - width;
        yPos = CGFloat(CCORandom.rand(Int(outerHeight)-1)+1)
        
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