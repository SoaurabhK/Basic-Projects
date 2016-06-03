//
//  ViewController.swift
//  USK-WebViewDemo
//
//  Created by Soaurabh on 23/08/15.
//  Copyright (c) 2015 Soaurabh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let url = NSURL(string: "http://www.google.com")
//        var request = NSURLRequest(URL: url!)
//        webView.loadRequest(request)
        
        //Adding/Loading HTML content into webView
        let html = "<html><head></head><body><h1>Hello SK!!!</h1></body></html>"
        webView.loadHTMLString(html, baseURL: nil) 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

