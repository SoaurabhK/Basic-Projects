//
//  ViewController.swift
//  Swipes And Shakes
//
//  Created by Rob Percival on 16/03/2015.
//  Copyright (c) 2015 Appfish. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    var sounds = ["bean", "belch", "giggle", "pew", "pig", "snore", "static", "uuu"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if event!.subtype == UIEventSubtype.MotionShake {
            
            
            let randomNumber = Int(arc4random_uniform(UInt32(sounds.count)))
            
            
            let fileLocation = NSBundle.mainBundle().pathForResource(sounds[randomNumber], ofType: "mp3")
            
            do { try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
                
            player.play()
                
            } catch {}
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

