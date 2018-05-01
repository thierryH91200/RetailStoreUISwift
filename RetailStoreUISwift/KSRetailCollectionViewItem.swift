//
//  KSRetailStoreCollectionViewItem.swift
//  RetailStoreUISwift
//
//  Created by thierryH24 on 29/04/2018.
//  Copyright © 2018 thierryH24. All rights reserved.
//

import AppKit

final class KSRetailCollectionViewItem: NSCollectionViewItem {
     
    @IBOutlet weak var itemImageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do view setup here.
    }
    
    override var representedObject: Any? {
        didSet {
            super.representedObject = representedObject
            
            if let rep = representedObject as? [String:String] {
                if let aKey = rep["itemImage"] {
                    itemImageView?.image = Bundle.main.image(forResource: NSImage.Name(rawValue: aKey))
                }
            }
            else {
//                titleTextField.stringValue = "No Value"
//                descriptionTextField.stringValue = "No Value"
//                detailDescription.stringValue = "No Value"
//                price.stringValue = "No Value"
            }
        }
    }
    
    
    override var isSelected: Bool {
        didSet {
            view.layer?.borderWidth = isSelected ? 5.0 : 0.0
            view.layer?.borderColor = NSColor.black.cgColor
        }
    }

}

