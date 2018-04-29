//
//  MainWindowController.swift
//  RetailStoreUISwift
//
//  Created by thierryH24 on 29/04/2018.
//  Copyright © 2018 thierryH24. All rights reserved.
//

import AppKit

class MainWindowController: NSWindowController , NSCollectionViewDelegate, NSCollectionViewDataSource {

    @IBOutlet weak var collectionView: NSCollectionView!
    var collectionViewItem : KSRetailStoreCollectionViewItem!
    var contents = [[String: String ]]()

    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        configureCollectionView()
        

        self.collectionViewItem = KSRetailStoreCollectionViewItem(nibName: NSNib.Name(rawValue:  "KSRetailStoreCollectionViewItem"), bundle: nil)
        self.contents = [
                    ["itemTitle": "Product 1",
                    "itemDescription": "Product 1 Description",
                     "itemDetailedDescription": "128 Ratings",
                     "itemPrice": "$20.90",
                     "itemImage": "PastedGraphic-1.png"],
                    
                    ["itemTitle": "Product 2", "itemDescription":
                     "Product 2 Description",
                     "itemDetailedDescription": "128 Ratings",
                     "itemPrice": "$10.90",
                     "itemImage": "PastedGraphic-3.png"],
                    
                    ["itemTitle": "Product 3", "itemDescription":
                     "Product 3 Description",
                     "itemDetailedDescription": "128 Ratings",
                     "itemPrice": "$9810.90",
                     "itemImage": "PastedGraphic-4.png"],
                    
                    ["itemTitle": "Product 4",
                     "itemDescription": "Some New Description",
                     "itemDetailedDescription": "128 Ratings",
                     "itemPrice": "$100.90",
                     "itemImage": "PastedGraphic-5.png"],
                    
                    ["itemTitle": "Product 5",
                     "itemDescription": "This product rocks",
                     "itemDetailedDescription": "128 Ratings",
                     "itemPrice": "$109.19",
                     "itemImage": "PastedGraphic-1.png"],
                    
                    ["itemTitle": "Product 6",
                     "itemDescription": "This product is for new users",
                     "itemDetailedDescription": "128 Ratings",
                     "itemPrice": "$910.90",
                     "itemImage": "PastedGraphic-6.png"],
                    
                    ["itemTitle": "Product 7",
                     "itemDescription": "The best we have built so far",
                     "itemDetailedDescription": "128 Ratings",
                     "itemPrice": "$632.90",
                     "itemImage": "PastedGraphic-7.png"]]
        
        
        
        let nib = NSNib(nibNamed: NSNib.Name(rawValue:  "KSRetailStoreCollectionViewItem"), bundle: nil)
        collectionView.register(KSRetailStoreCollectionViewItem.self, forItemWithIdentifier: .collectionViewItem)
        self.collectionView.register(nib, forItemWithIdentifier: .collectionViewItem)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
//        collectionView.itemPrototype = self.collectionViewItem
        collectionView.content = self.contents
        collectionView.reloadData()



        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    fileprivate func configureCollectionView() {
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 200.0, height: 300.0)
        flowLayout.sectionInset = NSEdgeInsets(top: 30.0, left: 20.0, bottom: 30.0, right: 20.0)
        flowLayout.minimumInteritemSpacing = 10.0
        flowLayout.minimumLineSpacing = 10.0
        flowLayout.sectionHeadersPinToVisibleBounds = true
        collectionView.collectionViewLayout = flowLayout
//        wantsLayer = true
        collectionView.layer?.backgroundColor = NSColor.black.cgColor
    }

    func numberOfSectionsInCollectionView(collectionView: NSCollectionView) -> Int {
        return 1 // <- This depends on the data being displayed
    }

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.contents.count // <- This depends on the data being displayed
    }

    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let collectionObject = self.contents[indexPath.item]
        let item = self.collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "KSRetailStoreCollectionViewItem"), for: indexPath)
        item.representedObject = collectionObject
        return item
    }

}

extension NSUserInterfaceItemIdentifier {
    static let collectionViewItem = NSUserInterfaceItemIdentifier("KSRetailStoreCollectionViewItem")
}

