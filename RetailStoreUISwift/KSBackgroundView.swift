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
        let startingColor = NSColor.black
        let endingColor = NSColor.darkGray
        let aGradient =  NSGradient(starting: startingColor, ending: endingColor)

        let bezierPath = NSBezierPath(roundedRect: bounds, xRadius: 0.0, yRadius: 0.0)
        aGradient?.draw(in: bezierPath, angle: 270)
    }
}

class KSFooterView : NSView  {
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        let startingColor = NSColor.black
        let endingColor = NSColor.darkGray
        let aGradient =  NSGradient(starting: startingColor, ending: endingColor)

        let bezierPath = NSBezierPath(roundedRect: bounds, xRadius: 0.0, yRadius: 0.0)
        aGradient?.draw(in: bezierPath, angle: 90)
    }
}

class KSWhiteBackgroundView : NSView  {
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        NSGraphicsContext.saveGraphicsState()
        NSColor(calibratedWhite: 0.85, alpha: 1.0).setFill()
        NSBezierPath(roundedRect: bounds, xRadius: 8.0, yRadius: 8.0).fill()
        NSGraphicsContext.restoreGraphicsState()
    }
}
