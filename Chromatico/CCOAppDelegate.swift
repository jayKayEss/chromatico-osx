//
//  CCOAppDelegate.swift
//  Chromatico
//
//  Created by Justin Sheckler on 6/14/14.
//  Copyright (c) 2014 Justin Sheckler. All rights reserved.
//

import Foundation

class CCOAppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet var window: NSWindow
    var chromaticoView: ChromaticoSaverView?
    
    func applicationDidFinishLaunching(aNotification: NSNotification!) {
        let contentView = window.contentView
        chromaticoView = ChromaticoSaverView(frame: contentView.frame, isPreview: true)
        contentView!.addSubview(chromaticoView!)
        
        chromaticoView!.startAnimation()
        
        // mimic screensaver framework
        NSTimer.scheduledTimerWithTimeInterval(
            chromaticoView!.animationTimeInterval(),
            target: chromaticoView!,
            selector: "animateOneFrame",
            userInfo: nil,
            repeats: true);
    }

    func applicationWillTerminate(aNotification: NSNotification!) {
        chromaticoView!.stopAnimation()
    }
    
}
