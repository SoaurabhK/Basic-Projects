//
//  DetailViewController.swift
//  Blog Reader
//
//  Created by Rob Percival on 25/09/2015.
//  Copyright © 2015 Appfish. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet var webView: UIWebView!

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let postWebview = self.webView {
                
                postWebview.loadHTMLString(detail.valueForKey("content")!.description, baseURL: NSURL(string:"http://googleblog.blogspot.co.uk/"));
                
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

