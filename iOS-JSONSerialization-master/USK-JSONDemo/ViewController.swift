//
//  ViewController.swift
//  USK-JSONDemo
//
//  Created by Soaurabh on 23/08/15.
//  Copyright (c) 2015 Soaurabh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://date.jsontest.com/")
        let session = NSURLSession.sharedSession()

        let task = session.dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print("Some error occured")
                
            } else {
                
                if let urlContent = data {
                    do {
                        
                        let jsonResult = (try NSJSONSerialization.JSONObjectWithData(urlContent, options: NSJSONReadingOptions.MutableContainers))
                        
                        print(jsonResult["date"]!)
                    } catch {
                        print("Error occured")
                    }
                    
                }
              
            }
        })
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

