//
//  FirstViewController.swift
//  USK-ToDoList
//
//  Created by Soaurabh Kakkar on 17/07/16.
//  Copyright © 2016 Soaurabh Kakkar. All rights reserved.
//

import UIKit

var toDoList:[String] = []
class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var toDoListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //toDoListTable.setEditing(true, animated: true)
        
        if let retList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as? [String]{
            toDoList = retList
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
    
    // This method will be called whenever users tries to edit an item in the table
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            toDoList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            toDoListTable.reloadData()
        }
    }
    
    //Need to reloadData when the user switches to this viewController after adding items
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        toDoListTable.reloadData()
    }

}

