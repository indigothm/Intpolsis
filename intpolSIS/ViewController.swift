//
//  ViewController.swift
//  intpolSIS
//
//  Created by Ilia Tikhomirov on 26/05/16.
//  Copyright © 2016 Ilia Tikhomirov. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let menuItems = ["Линолиеум", "Ламинат", "Ковры", "ПВХ", "Плинтус ПВХ", "Щетинестые Покрытия", "Придверные коврики", "Другое"]

    @IBOutlet weak var collectionView: UICollectionView!
    let identifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView.dataSource = self
        collectionView.delegate = self
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     
     func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let numberOfCell: CGFloat = 2
        let cellWidth = collectionView.bounds.size.width / numberOfCell - 8
        return CGSizeMake(cellWidth, 36)
    } 
     
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! MenuItemCollectionViewCell
        
        cell.menuLabel.text = menuItems[indexPath.item]
        
        return cell
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        
        if UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication().statusBarOrientation) {
            var cellWidth = collectionView.bounds.size.width / 2
            cellWidth = cellWidth - 8
            flowLayout.itemSize = CGSize(width: cellWidth, height: 36)
        } else {
            var cellWidth = collectionView.bounds.size.width / 2
            cellWidth = cellWidth - 8
            flowLayout.itemSize = CGSize(width: cellWidth, height: 36)
        }
        
        flowLayout.invalidateLayout()
    }


}

