//
//  CustomTabbarViewController.swift
//  intpolSIS
//
//  Created by Ilia Tikhomirov on 26/05/16.
//  Copyright © 2016 Ilia Tikhomirov. All rights reserved.
//

import UIKit

class CustomTabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let colorNormal : UIColor = UIColor(red:0.55, green:0.55, blue:0.55, alpha:1.0)
        let colorSelected : UIColor = UIColor(red:0.96, green:0.65, blue:0.14, alpha:1.0)
        let titleFontAll : UIFont = UIFont(name: ".SFUIText-Light", size: 13.0)!
        let attributesNormal = [
            NSForegroundColorAttributeName : colorNormal,
            NSFontAttributeName : titleFontAll
        ]
        let attributesSelected = [
            NSForegroundColorAttributeName : colorSelected,
            NSFontAttributeName : titleFontAll
        ]
    
        UITabBarItem.appearance().setTitleTextAttributes(attributesNormal, forState: .Normal)
        UITabBarItem.appearance().setTitleTextAttributes(attributesSelected, forState: .Selected)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
