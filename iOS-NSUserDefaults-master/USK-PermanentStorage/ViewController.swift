//
//  ViewController.swift
//  USK-PermanentStorage
//
//  Created by Soaurabh Kakkar on 17/07/16.
//  Copyright © 2016 Soaurabh Kakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSUserDefaults.standardUserDefaults().setObject("Soaurabh", forKey: "Name")
        
        if let userName = NSUserDefaults.standardUserDefaults().objectForKey("Name") {
            print(userName) //type is AnyObject
            
            if let retUserName = userName as? String {
                print(retUserName)
            }
        }
        
        //Note - NSUserDefaults does not store the type, it's always stored as AnyObject.
        let arr:[Int] = [1, 2, 3, 4]
        NSUserDefaults.standardUserDefaults().setObject(arr, forKey: "Array")
        
        if let retArr = NSUserDefaults.standardUserDefaults().objectForKey("Array") {
            print(retArr) // type is AnyObject
            
            if let returnArr = retArr as? NSArray {
                for x in returnArr {
                    print(x)
                }
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

