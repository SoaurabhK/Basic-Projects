//
//  ViewController.swift
//  USK-DownloadingWebContent
//
//  Created by Soaurabh Kakkar on 17/07/16.
//  Copyright © 2016 Soaurabh Kakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //To load the url request directly without downloading contents of url
        //self.webView.loadRequest(NSURLRequest(URL: url))
        
        if let url = NSURL(string: "http://stackoverflow.com/") {
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) in
                //will execute when task completes (i.e closure execution)
            
                if let urlContent = data {
                    if let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding) {
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            self.webView.loadHTMLString(String(webContent), baseURL: nil)
                        })
                        
                    }
                    
                } else {
                    // show error msg when no data returned
                    print("No data returned")
                }
            })
            task.resume()
            
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

