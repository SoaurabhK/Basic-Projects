//
//  ViewController.swift
//  Back To Bach
//
//  Created by Rob Percival on 23/06/2015.
//  Copyright © 2015 Appfish. All rights reserved.
//

// Reference - http://stackoverflow.com/questions/2654849/uislider-to-control-avaudioplayer

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()

    @IBAction func play(sender: AnyObject) {
        
        player.play()
        
    }
    @IBOutlet var volumeSlider: UISlider!
    
    @IBAction func adjustVolume(sender: AnyObject) {
        
        player.volume = volumeSlider.value
        
    }
  
    @IBOutlet var scrubSlider: UISlider!
    
    @IBAction func scrub(sender: AnyObject) {
        
        player.currentTime = NSTimeInterval(scrubSlider.value)
        
    }
    
    
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
        
    }
    @IBAction func stop(sender: AnyObject) {
        
        player.stop()
        player.currentTime = 0 //Reset the time of the music back to the starting of the sound file(zipping in sliders in mp3 players works by this property)
    }
    
    func updateScrubSlider() {
        
        scrubSlider.value = Float(player.currentTime)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
        
        try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bach", ofType: "mp3")!))
            
            scrubSlider.maximumValue = Float(player.duration)
        
        } catch {
            
            // It didn't work!
            
        }
        //you can also obeserve changes in 'player.currentTime' using kvo
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.updateScrubSlider), userInfo: nil, repeats: true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

