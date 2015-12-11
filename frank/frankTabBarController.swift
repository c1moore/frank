//
//  frankTabBarController.swift
//  frank
//
//  Created by Cory Armstrong on 12/10/15.
//  Copyright © 2015 frank. All rights reserved.
//

import UIKit

class frankTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the tab view's style.
        self.tabBar.barStyle = .Black;
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
