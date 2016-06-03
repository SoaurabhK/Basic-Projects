//
//  ViewController.swift
//  USK-HowManyFingers
//
//  Created by Soaurabh Kakkar on 05/06/16.
//  Copyright © 2016 Soaurabh Kakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var guessTextField: UITextField!
    
    @IBOutlet weak var resLabel: UILabel!
    
    
    @IBAction func guessUserInput(sender: AnyObject) {
        
        //check if the input is there
        if guessTextField.text?.characters.count != 0 {
            
            //check if the input is Int-Number
            if let enteredNum = Int(guessTextField.text!) {
                
                let randNum:Int = Int(arc4random_uniform(6));//generate a random number b/w 0 to 5(Inclusive)
                
                if enteredNum == randNum {
                    
                    resLabel.text = "Congrats, your guess is coreect!"
                } else if enteredNum > 5 || enteredNum < 0 {
                    
                    resLabel.text = "Enter number should be between 0 to 5!"
                } else {
                    
                    resLabel.text = "Please try again!"
                }
            } else {
                
                resLabel.text = "Please enter an integer input b/w 0 to 5!"
            }
        } else {
            
            resLabel.text = "Please enter some input!"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

