//
//  KSBackgroundView.swift
//  RetailStoreUISwift
//
//  Created by thierryH24 on 29/04/2018.
//  Copyright © 2018 thierryH24. All rights reserved.
//

import Cocoa

class KSHeaderView : NSView {
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        var startingColor: NSColor?
        var endingColor: NSColor?
        var aGradient: NSGradient?
        startingColor = NSColor.black
        endingColor = NSColor.darkGray
        if let aColor = startingColor, let aColor1 = endingColor {
            aGradient = NSGradient(starting: aColor, ending: aColor1)
        }
        let bezierPath = NSBezierPath(roundedRect: bounds, xRadius: 0.0, yRadius: 0.0)
        aGradient?.draw(in: bezierPath, angle: 270)
    }
}

class KSFooterView : NSView  {
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        var startingColor: NSColor?
        var endingColor: NSColor?
        var aGradient: NSGradient?
        startingColor = NSColor.black
        endingColor = NSColor.darkGray
        if let aColor = startingColor, let aColor1 = endingColor {
            aGradient = NSGradient(starting: aColor, ending: aColor1)
        }
        let bezierPath = NSBezierPath(roundedRect: bounds, xRadius: 0.0, yRadius: 0.0)
        aGradient?.draw(in: bezierPath, angle: 90)
    }
}

class KSWhiteBackgroundView : NSView  {
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        NSGraphicsContext.saveGraphicsState()
        NSColor(calibratedWhite: 0.95, alpha: 1.0).setFill()
        NSBezierPath(roundedRect: bounds, xRadius: 8.0, yRadius: 8.0).fill()
        NSGraphicsContext.restoreGraphicsState()
    }
}
