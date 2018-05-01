//
//  KSRetailStoreCollectionViewItem.swift
//  RetailStoreUISwift
//
//  Created by thierryH24 on 29/04/2018.
//  Copyright © 2018 thierryH24. All rights reserved.
//

import AppKit

final class KSRetailStoreCollectionViewItem: NSCollectionViewItem {
 
    @IBOutlet weak var titleTextField: NSTextField!
    
    @IBOutlet weak var descriptionTextField: NSTextField!
    @IBOutlet weak var detailDescription: NSTextField!
    @IBOutlet weak var price: NSTextField!
    @IBOutlet weak var itemImageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do view setup here.
    }
    
    override var representedObject: Any? {
        didSet {
            super.representedObject = representedObject
            
            if let rep = representedObject as? [String:String] {

                titleTextField?.stringValue = rep["itemTitle"] ?? ""
                descriptionTextField?.stringValue = rep["itemDescription"] ?? ""
                detailDescription?.stringValue = rep["itemDetailedDescription"] ?? ""
                price?.stringValue = rep["itemPrice"] ?? ""
                if let aKey = rep["itemImage"] {
                    itemImageView?.image = Bundle.main.image(forResource: NSImage.Name(rawValue: aKey))
                    print("\(aKey)")

                }
            }
            else {
                titleTextField.stringValue = "No Value"
                descriptionTextField.stringValue = "No Value"
                detailDescription.stringValue = "No Value"
                price.stringValue = "No Value"
            }
        }
    }
    
    @IBAction func addtoCart(_ sender: Any) {
        print("addtoCart")
    }
}

