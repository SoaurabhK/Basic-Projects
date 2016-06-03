//
//  ViewController.swift
//  USK-Audio
//
//  Created by Soaurabh on 23/08/15.
//  Copyright (c) 2015 Soaurabh. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var sliderValue: UISlider!
    var player:AVAudioPlayer = AVAudioPlayer()
    @IBAction func play(sender: AnyObject) {
           player.play()
    }
    
    @IBAction func pause(sender: AnyObject) {
        player.pause()
    }
    @IBAction func stop(sender: AnyObject) {
        player.stop()
        player.currentTime = 0 //Reset the time of the music back to the starting of the sound file(zipping in sliders in mp3 players works by this property)
    }
    @IBAction func sliderChanged(sender: AnyObject) {
        player.volume = sliderValue.value // player volume is always b/w 0-1 and so is slider value
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let audioPath =  NSBundle.mainBundle().pathForResource("bach1", ofType: "mp3")!
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            
        } catch{
            //Process Error here
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

