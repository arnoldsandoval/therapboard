//
//  MenuViewController.swift
//  DNApp
//
//  Created by Arnold Sandoval on 2/12/16.
//  Copyright © 2016 Arnold Sandoval. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var menuView: SpringView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var filterButtonPopular: UIButton!
    @IBOutlet weak var filterButtonFavorites: UIButton!
    @IBOutlet weak var emailButton: UIButton!

//  Some other ideas for filters...
//    @IBOutlet weak var filterButtonExplicit: UIButton!
//    @IBOutlet weak var filterButtonClean: UIButton!
//    @IBOutlet weak var filterButtonClassics: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.tintColor = UIColor(red:0.956, green:0.947, blue:0.866, alpha:1)
        menuView.backgroundColor = UIColor(red:0.849, green:0.206, blue:0.168, alpha:1)

        menuView.autostart = true
        menuView.animation = "slideRight"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonDidTouch(sender: AnyObject) {
        menuView.animation = "slideRight"
        menuView.animateFrom = false
        menuView.animateToNext({
            self.dismissViewControllerAnimated(false, completion: nil)
        })
    }
    
    @IBAction func emailButtonDidTouch(sender: AnyObject) {
        NSLog("hi") 
        let email = "holler@therapboard.com"
        let url = NSURL(string: "mailto:\(email)")
        UIApplication.sharedApplication().openURL(url!)
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
