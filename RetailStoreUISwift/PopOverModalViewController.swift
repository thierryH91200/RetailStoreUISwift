//
//  MainWindowController.swift
//  RetailStoreUISwift
//
//  Created by thierryH24 on 29/04/2018.
//  Copyright © 2018 thierryH24. All rights reserved.
//

import AppKit

@objc
public protocol PopOverModalDelegate
{
    /// Called when a value has been selected inside the outline.
    @objc func changeView( name : String)
}

final class PopOverModalViewController: NSViewController {
    
    @IBOutlet weak var collectionView: NSCollectionView!
    var collectionViewItem : KSRetailCollectionViewItem!
    var contents = [[String: String ]]()
    
    @objc open weak var delegate: PopOverModalDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        
        self.collectionViewItem = KSRetailCollectionViewItem(nibName: NSNib.Name(rawValue:  "KSRetailCollectionViewItem"), bundle: nil)
        self.contents = [
            ["itemTitle": "Product 1",
             "itemDescription": "Product 1 Description",
             "itemDetailedDescription": "128 Ratings",
             "itemPrice": "$20.90",
             "itemImage": "icons8-museum-80.png"],
            
            ["itemTitle": "Product 2",
             "itemDescription": "Product 2 Description",
             "itemDetailedDescription": "128 Ratings",
             "itemPrice": "$10.90",
             "itemImage": "icons8-money-box-80.png"],
            
            ["itemTitle": "Product 3",
             "itemDescription": "Product 3 Description",
             "itemDetailedDescription": "128 Ratings",
             "itemPrice": "$9810.90",
             "itemImage": "icons8-money-100.png"],
            
            ["itemTitle": "Product 4",
             "itemDescription": "Some New Description",
             "itemDetailedDescription": "128 Ratings",
             "itemPrice": "$100.90",
             "itemImage": "icons8-expensive-100.png"],
            
            ["itemTitle": "Product 5",
             "itemDescription": "This product rocks",
             "itemDetailedDescription": "128 Ratings",
             "itemPrice": "$109.19",
             "itemImage": "icons8-purse-100.png"],
            
            ["itemTitle": "Product 6",
             "itemDescription": "This product is for new users",
             "itemDetailedDescription": "128 Ratings",
             "itemPrice": "$910.90",
             "itemImage": "icons8-wallet-80.png"],
            
            ["itemTitle": "Product 7",
             "itemDescription": "This product is for new users",
             "itemDetailedDescription": "128 Ratings",
             "itemPrice": "$910.90",
             "itemImage": "icons8-safe-100.png"],
            
            ["itemTitle": "Product 8",
             "itemDescription": "This product is for new users",
             "itemDetailedDescription": "128 Ratings",
             "itemPrice": "$910.90",
             "itemImage": "icons8-credit-card-100.png"],
            
            ["itemTitle": "Product 9",
             "itemDescription": "The best we have built so far",
             "itemDetailedDescription": "128 Ratings",
             "itemPrice": "$632.90",
             "itemImage": "icons8-paypal-100.png"]]
        
        let nib = NSNib(nibNamed: NSNib.Name(rawValue:  "KSRetailCollectionViewItem"), bundle: nil)
        collectionView.register(KSRetailCollectionViewItem.self, forItemWithIdentifier: .collectionViewItem)
        self.collectionView.register(nib, forItemWithIdentifier: .collectionViewItem)
        
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    fileprivate func configureCollectionView() {
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 100.0, height: 100.0)
        flowLayout.sectionInset = NSEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        flowLayout.minimumInteritemSpacing = 5.0
        flowLayout.minimumLineSpacing = 5.0
        flowLayout.sectionHeadersPinToVisibleBounds = true
        collectionView.collectionViewLayout = flowLayout
        collectionView.layer?.backgroundColor = NSColor.black.cgColor
    }
    
}

extension PopOverModalViewController : NSCollectionViewDataSource
{
    func numberOfSectionsInCollectionView(collectionView: NSCollectionView) -> Int {
        return 1 // <- This depends on the data being displayed
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.contents.count // <- This depends on the data being displayed
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let collectionObject = self.contents[indexPath.item]
        let item = self.collectionView.makeItem(withIdentifier: .collectionViewItem, for: indexPath)
        item.representedObject = collectionObject
        return item
    }
    
}

extension PopOverModalViewController : NSCollectionViewDelegate
{
    func collectionView (_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>)
    {
        guard let indexPath = indexPaths.first else { return }
        guard let item = collectionView.item(at: indexPath) else { return }
        
        let rep = (item as! KSRetailCollectionViewItem).representedObject as? [String:String]
        let nameController = rep!["itemImage"]!
        
        delegate?.changeView(name: nameController)
    }
    
}

extension NSUserInterfaceItemIdentifier {
    static let collectionViewItem = NSUserInterfaceItemIdentifier("KSRetailCollectionViewItem")
}

