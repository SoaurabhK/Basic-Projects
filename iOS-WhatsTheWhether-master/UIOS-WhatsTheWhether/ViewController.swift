//
//  ViewController.swift
//  UIOS-WhatsTheWhether
//
//  Created by Soaurabh Kakkar on 22/03/16.
//  Copyright © 2016 Soaurabh Kakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBAction func findWhether(sender: AnyObject) {
        
        var isSucess = false;
        if let url = NSURL(string: "http://www.weather-forecast.com/locations/" + cityTextField.text!.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest") {
            let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
                if let urlContent = data {
                    let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding);
                    let websiteArray = webContent!.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">");
                    
                    if websiteArray.count > 1 { //Means at least one occurence found
                        let whetherArr = websiteArray[1].componentsSeparatedByString("</span>")
                        if whetherArr.count > 1 { //Means at least one occurence found
                            isSucess = true;
                            let whetherSummary = whetherArr[0].stringByReplacingOccurrencesOfString("&deg;", withString: "º");
                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                self.resultLabel.text = whetherSummary;
                            })
                        }
                    }
                    
                }
                
                if isSucess == false {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.resultLabel.text = "Couldn't find the whether for that city.";
                    })
                }
            }
            task.resume()
        } else {
            resultLabel.text = "Couldn't find the whether for that city.";
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.cityTextField.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}

