//
//  ChromaticoSaverView.swift
//  Chromatico
//
//  Created by Justin Sheckler on 6/14/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

import Foundation
import ScreenSaver
import QuartzCore

class ChromaticoSaverView : ScreenSaverView {
    
    var hostedLayer: CALayer
    var layers: CCOLayer[]
    var palette: CCOPalette
    var paletteTimer: NSTimer?
        
    init(frame: NSRect, isPreview: Bool) {
        hostedLayer = CALayer()
        layers = Array()
        palette = CCOPalette()

        super.init(frame: frame, isPreview: isPreview)

        palette.changeToNewColors()
    
        // Disable runloop; we don't need it and it eats up power
        setAnimationTimeInterval(NSTimeInterval(HUGE))

        wantsLayer = true
        hostedLayer.backgroundColor = palette.grabColor()
        layer = hostedLayer
        
        for (var i=0; i<3; i++) {
            let newLayer = CCOBlockLayer(palette: palette)
            addCCOLayer(newLayer)
        }
    
        for (var i=0; i<3; i++) {
            let newLayer = CCOStripeLayer(palette: palette)
            addCCOLayer(newLayer)
        }
    
        for (var i=0; i<5; i++) {
            let newLayer = CCOTextLayer(palette: palette)
            addCCOLayer(newLayer)
        }
    }
    
    
    func addCCOLayer(newLayer: CCOLayer) {
        newLayer.outerBounds = layer.bounds
        layer.addSublayer(newLayer.layer)
        layers.append(newLayer)
    }
    
    override func startAnimation() {
        super.startAnimation()

        for (thisLayer) in self.layers {
            thisLayer.startAnimation()
        }
        
        if (paletteTimer?.valid) {
            paletteTimer?.invalidate()
        }

        paletteTimer = NSTimer(timeInterval: NSTimeInterval(60),
            target: self,
            selector: "changePalette",
            userInfo: nil,
            repeats: false)
    }
    
    override func stopAnimation() {
        super.stopAnimation()
        
        for (thisLayer) in layers {
            thisLayer.stopAnimation()
        }
        
        paletteTimer?.invalidate()
    }
    
    override func drawRect(rect: NSRect) {
        super.drawRect(rect)
    }
    
    override func animateOneFrame() {
    }
    
    func changePalette() {
        palette.changeToNewColors();
        let duration = CFTimeInterval(CCOConstants.colorAnimationDuration)
        
        let color = palette.grabColor()
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(duration)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: "kCAMediaTimingFunctionLinear"))
        layer.backgroundColor = color
        CATransaction.commit()
        
        for (thisLayer) in layers {
            thisLayer.changeColor()
        }
    }
    
    override func hasConfigureSheet() -> Bool {
        return false
    }
    
    override func configureSheet() -> NSWindow! {
        return nil
    }
    
}