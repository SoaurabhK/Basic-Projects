//
//  ViewController.swift
//  UIOS-CoreDataDemo
//
//  Created by Soaurabh Kakkar on 24/03/16.
//  Copyright © 2016 Soaurabh Kakkar. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Saving the data in the entity
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context : NSManagedObjectContext = appDel.managedObjectContext
        
        /*let newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        newUser.setValue("Kirsten", forKey: "username")
        newUser.setValue("pss123", forKey: "password")
        
        do{
            try context.save()
        }catch {
            //print failure msg
            print("Save Failure Occured")
        }*/
        
        //Reteriving the data from the entity
        let request = NSFetchRequest(entityName: "Users")
        
        // if i want to search(want to see only specific results), add predicte to the request
        request.predicate = NSPredicate(format: "username = %@", "Ralphie")
        
        request.returnsObjectsAsFaults = false //By default it's true, True returns faults(kind of outline of actual data) for the actual data.
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    //context.deleteObject(result) //-- for deleting objects from CoreData
                    //result.setValue("Ralphie", forKey: "username") -- for updating objects value in CoreData
                    //Note- it's required to save the context to update/sync values in Coredata
                    do{
                        try context.save()
                    }catch {
                        //print failure msg
                        print("Save Failure Occured")
                    }
                    
                    if let username = result.valueForKey("username") as? String {
                        print(username);
                    }
                    
                    //print(result.valueForKey("password")!);
                }
                
            }
            print(results);
        } catch{
            print("Fetch Failed")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

