//
//  ViewController.swift
//  USK-AdvancedSegues
//
//  Created by Soaurabh on 22/08/15.
//  Copyright (c) 2015 Soaurabh. All rights reserved.
//

import UIKit

var rowCounter:Int = 0 //Global variable, acessible within this viewController file and in any other .swift file

class ViewController: UIViewController {
//Segues -- helps in moving from one viewController to another
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(rowCounter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

