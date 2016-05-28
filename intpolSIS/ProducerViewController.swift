//
//  ProducerViewController.swift
//  intpolSIS
//
//  Created by Ilia Tikhomirov on 28/05/16.
//  Copyright © 2016 Ilia Tikhomirov. All rights reserved.
//

import UIKit

class ProducerViewController: UIViewController,  UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var entry: String?

    @IBOutlet weak var collectionView: UICollectionView!
    var menuItems = ["Линолиеум", "Ламинат", "Ковры", "ПВХ", "Плинтус ПВХ", "Щетинестые Покрытия", "Придверные коврики", "Другое"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ENTRY VALUE")
        print(entry)
        
        switch entry! {
        case "Линолиеум":
            print("Линолиеум")
            menuItems = ["BEAULIEU (БЕЛЬГИЯ)", "IVC (БЕЛЬГИЯ", "JUTEKS (СЛОВЕНИЯ)", "POLYSTYL", "TARKETT"]
        case "Ламинат":
            print("Ламинат")
        case "Ковры":
            print("Ковры")
        case "ПВХ":
            print("Плинтус ПВХ")
        case "Щетинестые Покрытия":
            print("Щетинестые Покрытия")
        case "Придверные коврики":
            print("Придверные коврики")
        case "Другое":
            print("Другое")
        default:
            print("ERROR")
        }

        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsSelection = true
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
        return menuItems.count
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
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! MenuItemCollectionViewCell
        cell.backgroundColor = UIColor(red:0.93, green:0.92, blue:0.92, alpha:1.0)
        print(cell.menuLabel.text)
        performSegueWithIdentifier("showProducts", sender: self)
        cell.backgroundColor = UIColor.clearColor()
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
