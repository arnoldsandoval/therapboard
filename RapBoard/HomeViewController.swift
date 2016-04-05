
//
//  ViewController.swift
//  RapBoard
//
//  Created by Arnold Sandoval on 2/15/16.
//  Copyright © 2016 Arnold Sandoval. All rights reserved.
//

import UIKit
import AVFoundation


class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, AVAudioPlayerDelegate {
    
    @IBOutlet weak var menuNavButton: UIBarButtonItem!
    @IBOutlet weak var twitterNavButton: UIBarButtonItem!
    
    
    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    
    func playSound(soundURL: NSURL) {
        
        do { audioPlayer = try AVAudioPlayer(contentsOfURL: soundURL, fileTypeHint: nil) } catch let error as NSError {
            print(error.description)
        }
        
        audioPlayer.numberOfLoops = 0 // play once
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
        func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
            //You can stop the audio
            NSLog("done")
            
        }
        
    }

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        return CGSize(width: screenWidth/4, height: screenWidth/2.25);
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: SoundboardCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! SoundboardCollectionViewCell

        let name = data[indexPath.row]["name"]!.uppercaseString as String
        let photo = data[indexPath.row]["photo"]! as! String

        cell.rapperName.text = name
        cell.rapperImage.image = UIImage(named: photo)
        
//        cell.rapperNameTip.transform = CGAffineTransformMakeRotation(-10)

        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

        let audioFileName = String(data[indexPath.row]["audio"]![0]!)
        
        print(audioFileName)

        let audioURL: NSURL = NSBundle.mainBundle().URLForResource(audioFileName, withExtension: "mp3")!
        
        playSound(audioURL)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {

        let nav = self.navigationController?.navigationBar
        
        nav?.barTintColor = UIColor(red:0.668, green:0.085, blue:0.071, alpha:1)
        nav?.tintColor = UIColor(red:0.956, green:0.947, blue:0.866, alpha:1)

        nav?.shadowImage = UIImage();
        nav?.setBackgroundImage(UIImage(), forBarMetrics: .Default)

        let titleImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        titleImageView.contentMode = .ScaleAspectFit

        let titleImage = UIImage(named: "logo")
        titleImageView.image = titleImage

        navigationItem.titleView = titleImageView
        
        menuNavButton.title = ""
        menuNavButton.image = UIImage(named: "icon-hamburger")
        
        twitterNavButton.title = ""
        twitterNavButton.image = UIImage(named: "icon-twitter")
        
    }

    @IBAction func menuButtonDidTouch(sender: AnyObject) {
        performSegueWithIdentifier("MenuSegue", sender: self)
    }
    
    @IBAction func twitterButtonDidTouch(sender: AnyObject) {
        guard UIApplication.sharedApplication().canOpenURL(NSURL(string: "twitter://user?screen_name=therapboard")!) else {
                NSLog("No Twitter!!??  You're a better man than I am, Charlie Brown.")
                performSegueWithIdentifier("WebSegue", sender: self)
                return
            }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "WebSegue" {
            let toView = segue.destinationViewController as! WebViewController
            let url = "http://www.twitter.com/therapboard"
            toView.url = url
            
            self.minimizeView()
        }
        
        // There is a better way to do this. I just dont know what it is yet.
        if segue.identifier == "MenuSegue" {
            self.minimizeView()
//            navigationController?.view.transform = CGAffineTransformMakeScale(0.9, 0.9);
            
        }
    }
    
    func minimizeView() {
        NSLog("minimizeView")
        SpringAnimation.spring(0.7, animations: {
            self.view.transform = CGAffineTransformMakeScale(0.9, 0.9)
        })
    }
    
    func maximizeView(sender: AnyObject) {
        SpringAnimation.spring(0.7, animations: {
            self.view.transform = CGAffineTransformMakeScale(1, 1)
        })
    }
    
}
