//
//  CCOLayer.swift
//  Chromatico
//
//  Created by Justin Sheckler on 6/14/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

import Foundation
import QuartzCore

class CCOLayer {
    
    let palette: CCOPalette
    let layer: CALayer
    
    var outerBounds: CGRect!
    var xPos: CGFloat!
    var yPos: CGFloat!
    var xFinal: CGFloat!
    
    var shouldContinueAnimation: Bool
    
    init(palette: CCOPalette, layer: CALayer) {
        self.palette = palette
        self.layer = layer
        shouldContinueAnimation = false
    }
    
    func startAnimation() {
        shouldContinueAnimation = true
        animate()
    }
    
    func stopAnimation() {
        shouldContinueAnimation = false
    }
    
    func setUpGeometry() {
        // subclasses should implement
    }
    
    func animate() {
        setUpGeometry()
        
        let duration = CGFloat(CCORandom.rand(110) + 10)

        var moveLeft = CABasicAnimation(keyPath: "position")
        moveLeft.fromValue = NSValue(point: CGPointMake(xPos, yPos))
        moveLeft.toValue = NSValue(point: CGPointMake(xFinal, yPos))
        moveLeft.duration = duration
        
        layer.position = CGPointMake(xPos, yPos)
        
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            if self.shouldContinueAnimation {
                self.animate()
            }
            })
        
        layer.addAnimation(moveLeft, forKey: "position")
        
        CATransaction.commit()
        
    }
    
    func changeColor() {
        // subclasses should implement!
    }
    
}