//
//  ViewController.swift
//  UdemyRob-HelloWorld
//
//  Created by Soaurabh Kakkar on 02/06/16.
//  Copyright © 2016 Soaurabh Kakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        //finds cat's age in cat-years
        print("Button Pressed!")
        
        if textField.text?.characters.count != 0 {
            if let age = Int(textField.text!) {
                resultLabel.text = " Cat's age is \(age * 7)"
            } else{
                resultLabel.text = "Please enter an integer input"
            }
        } else {
            resultLabel.text = "Please enter something"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("This is cool!!!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

