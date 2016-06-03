//
//  ViewController.swift
//  USK-IsItPrime
//
//  Created by Soaurabh Kakkar on 05/06/16.
//  Copyright © 2016 Soaurabh Kakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userTextInput: UITextField!
    
    @IBOutlet weak var resLabel: UILabel!
    
    @IBAction func checkPrime(sender: AnyObject) {
        
        if userTextInput.text?.characters.count != 0 {
            if let num = Int(userTextInput.text!) {
                
                let retVal:Bool = isNumPrime(num)
                
                if retVal {
                    
                    resLabel.text = "Yes, \(num) is a prime number";
                } else {
                    
                    resLabel.text = "\(num) is not a prime number";
                }
                
            } else{
                
                resLabel.text = "Please enter a positive integer!";
            }
        } else {
            
            resLabel.text = "Please enter something!";
        }
        
    }
    
    func isNumPrime(let num:Int) -> Bool {
        
        if num < 2 {
            return false
        }
        
        var isPrime : Bool = true;
        let sqrtNum : Int = Int(sqrt(Double(num)));
        
        for i in 2...(sqrtNum + 1) {
            if num % i == 0  && num != i {
                isPrime = false
                break;
            }
        }
        return isPrime;
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

