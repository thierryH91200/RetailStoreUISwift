//
//  AddCompteModalWindowController.swift
//  ComptaGraphVa
//
//  Created by thierryH24 on 03/03/2018.
//  Copyright © 2018 thierryH24. All rights reserved.
//

import AppKit

final class MainWindowController: NSWindowController, NSPopoverDelegate {
    
    @IBOutlet weak var nameCompte: NSTextField!
    @IBOutlet weak var imageView: NSImageView!
    
    lazy var popover: NSPopover = {
        let popover = NSPopover()
        popover.behavior = .semitransient
        let popOverModalViewController = PopOverModalViewController()
        popOverModalViewController.mainWindowController = self
        popover.contentViewController = popOverModalViewController
        popover.delegate = self
        return popover
    }()
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    override var windowNibName: NSNib.Name? {
        return NSNib.Name(rawValue: "MainWindowController")
    }
    
    @IBAction func didTapCancelButton(_ sender: Any) {
        window?.sheetParent?.endSheet(window!, returnCode: .cancel)
        self.window!.close()
    }
    
    @IBAction func didTapDoneButton(_ sender: Any) {
        window?.sheetParent?.endSheet(window!, returnCode: .OK)
        self.window!.close()
    }
    
    @IBAction func show(_ sender: NSButton) {
        
        let positioningView = sender
        let positioningRect = NSZeroRect
        let preferredEdge = NSRectEdge.minY
        
        popover.show(relativeTo: positioningRect, of: positioningView, preferredEdge: preferredEdge)
    }
    
    func changeView(name: String) {
        imageView.image =  NSImage(named:NSImage.Name(rawValue: name))
        
    }
    
}
