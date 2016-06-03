//
//  ViewController.swift
//  USK-StopWatch
//
//  Created by Soaurabh Kakkar on 14/07/16.
//  Copyright © 2016 Soaurabh Kakkar. All rights reserved.
//

//Challenges -- Hours, Min, Sec and update them all
//(can be done with updating three labels)

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var time = 0
    var isGoing = false
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var timerLabel: UILabel!
    
    var btnStop: UIBarButtonItem {
        
        return UIBarButtonItem (barButtonSystemItem: .Stop, target: self, action: #selector(ViewController.reset(_:)))
        
    }
    
    var btnPlay: UIBarButtonItem {
        
        return UIBarButtonItem (barButtonSystemItem: .Play, target: self, action: #selector(ViewController.play(_:)))
        
    }
    
    var btnPause: UIBarButtonItem {
        
        return UIBarButtonItem (barButtonSystemItem: .Pause, target: self, action: #selector(ViewController.pause(_:)))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timerLabel.text = "0"
        self.setupToolbar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func play(sender: AnyObject) {
        if isGoing == false {
            isGoing = true
            self.setupToolbar()
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.incrementTime), userInfo:nil, repeats: true)
        }
    }
    
    @IBAction func pause(sender: AnyObject) {
        isGoing = false
        timer.invalidate()
        self.setupToolbar()
    }
    
    @IBAction func reset(sender: AnyObject) {
        time = 0
        timerLabel.text = "\(time)"
        isGoing = false
        timer.invalidate()
        self.setupToolbar()
    }
    
    func incrementTime(timer:NSTimer) {
        
        time += 1;
        timerLabel.text = "\(time)"
        
        /*
         //function level static variables in swift
         struct TimeElapsed {
         static var time = 0
         }
         TimeElapsed.time += 1
         
         //passing objects in timer's user info
         if let userInfo = timer.userInfo as? Int {
         print(userInfo)
         }
         //Invalidating timers
         timer.invalidate()*/
    }
    
    func setupToolbar() {
        
        var buttonToShow: UIBarButtonItem
        
        if isGoing {
            
            buttonToShow = btnPause
            
        }else {
            
            buttonToShow = btnPlay
            
        }
        
        navigationBar.topItem!.leftBarButtonItem = buttonToShow
        navigationBar.topItem!.rightBarButtonItem = btnStop
    }
    
}

/*
 in the MainStoryBoard add a ToolBar with no item in it. Drag it into your .swift:
 
 @IBOutlet weak var toolbar: UIToolbar!
 
 then declare 4 BarButtonItem as follow:
 
 var btnStop: UIBarButtonItem {
 
    return UIBarButtonItem (barButtonSystemItem: .Stop, target: self, action: "yourFunction:")
 
 }
 
 var btnPlay: UIBarButtonItem {
 
    return UIBarButtonItem (barButtonSystemItem: .Play, target: self, action: "yourFunction:")
 
 }
 
 var btnPause: UIBarButtonItem {
 
    return UIBarButtonItem (barButtonSystemItem: .Pause, target: self, action: "yourFunction:")
 
 }
 
 var flexBar: UIBarButtonItem {
 
    return UIBarButtonItem (barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
 
 }
 
 create a function to setup the toolbar:
 
 func setupToolbar() {
 
    var buttonToShow: UIBarButtonItem
 
    if isGoing {
 
        buttonToShow = btnPause
 
    }else {
 
        buttonToShow = btnPlay
 
    }
 
    let toolbarButtonItems = [btnStop, flexBar, buttonToShow]
 
    toolbar.setItems(toolbarButtonItems, animated: true)
 
 }
 
 From here you should have a good understanding, of how it works, then you can change the items you want in your toolbar. You just need to add the appropriate function "yourFunction", then add some if statement to check which icon to display
 
 */


