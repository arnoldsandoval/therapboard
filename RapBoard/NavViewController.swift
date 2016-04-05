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
    @IBOutlet weak var switchMostPopular: UISwitch!
    @IBOutlet weak var switchMyFavorites: UISwitch!
    @IBOutlet weak var switchExplicit: UISwitch!
    @IBOutlet weak var switchNames: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.tintColor = UIColor(red:0.956, green:0.947, blue:0.866, alpha:1)
        menuView.backgroundColor = UIColor(red:0.849, green:0.206, blue:0.168, alpha:1)

        menuView.autostart = true
        menuView.animation = "slideRight"
            
        let defaults = NSUserDefaults.standardUserDefaults()
    
        if (defaults.objectForKey("ShowMostPopular") != nil) {
            switchMostPopular.on = defaults.boolForKey("ShowMostPopular")
        }
        if (defaults.objectForKey("ShowFavorites") != nil) {
            switchMyFavorites.on = defaults.boolForKey("ShowFavorites")
        }
        if (defaults.objectForKey("ShowExplicit") != nil) {
            switchExplicit.on = defaults.boolForKey("ShowExplicit")
        }
        if (defaults.objectForKey("ShowNames") != nil) {
            switchNames.on = defaults.boolForKey("ShowNames")
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonDidTouch(sender: AnyObject) {
        menuView.animation = "slideRight"
        menuView.animateFrom = false
        menuView.animateToNext({
            UIApplication.sharedApplication().sendAction("maximizeView", to: self.parentViewController, from: self, forEvent: nil)

            self.dismissViewControllerAnimated(false, completion: nil)
        })
        
    }
    
    @IBAction func emailButtonDidTouch(sender: AnyObject) {
        NSLog("hi") 
        let email = "holler@therapboard.com"
        let url = NSURL(string: "mailto:\(email)")
        UIApplication.sharedApplication().openURL(url!)
    }
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    
    @IBAction func saveNameSwitchState(sender: AnyObject) {
        if switchNames.on {
            defaults.setBool(true, forKey: "ShowNames")
        } else {
            defaults.setBool(false, forKey: "ShowNames")
        }
    }
    
    @IBAction func saveNameSwitchState(sender: AnyObject) {
        if switchNames.on {
            defaults.setBool(true, forKey: "ShowNames")
        } else {
            defaults.setBool(false, forKey: "ShowNames")
        }
    }
    
    @IBAction func saveNameSwitchState(sender: AnyObject) {
        if switchNames.on {
            defaults.setBool(true, forKey: "ShowNames")
        } else {
            defaults.setBool(false, forKey: "ShowNames")
        }
    }
    
    @IBAction func saveNameSwitchState(sender: AnyObject) {
        if switchNames.on {
            defaults.setBool(true, forKey: "ShowNames")
        } else {
            defaults.setBool(false, forKey: "ShowNames")
        }
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
