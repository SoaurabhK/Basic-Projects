//
//  ViewController.swift
//  USK-StoringImages
//
//  Created by Soaurabh on 23/08/15.
//  Copyright (c) 2015 Soaurabh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let url = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Johann_Sebastian_Bach.jpg/250px-Johann_Sebastian_Bach.jpg")!
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            if error != nil {
                print("There was an error")
            } else {
                //let image = UIImage(data: data)
                //dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    //self.myImageView.image = image (we can set it on our imageView from here or save the image for futute use as well)
                // })
                
                //Saving the image for future use
                var documentsDirectory:String?
                
                var paths:[String] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                
                if paths.count > 0 {
                    documentsDirectory = paths[paths.count - 1]
                    
                    let savePath = documentsDirectory! + "/bach.jpg"
                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.myImageView.image = UIImage(named: savePath)
                    })
                    
                }
                
            }
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

