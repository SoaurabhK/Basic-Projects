//
//  ViewController.swift
//  USK-WhereAmI
//
//  Created by Soaurabh on 22/08/15.
//  Copyright (c) 2015 Soaurabh. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var altitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var manager:CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.distanceFilter = 100.0 //the distanceFilter property allows you to set the distance in meters the device must travel before the location is updated//
        manager.pausesLocationUpdatesAutomatically = false
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        print(locations)
        
        let userLocation:CLLocation = locations[0]
        
        latitudeLabel.text = "\(userLocation.coordinate.latitude)"
        
        longitudeLabel.text = "\(userLocation.coordinate.longitude)"
        
        courseLabel.text = "\(userLocation.course)"
        
        speedLabel.text = "\(userLocation.speed)"
        
        altitudeLabel.text = "\(userLocation.altitude)"
        //Geocoding is process of going from Address/Place --> Coordinate(longitude and latitude)
//Reverse-Geocoding is process of going from Coordinate(longitude and latitude) --> Address/Place
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) -> Void in
            //Placemarks -- is array of addresses
            if error != nil {
                print(error)
            } else {
                if let p = placemarks?[0] {
                    print(p)
                    var subThoroughfare:String = ""
                    if (p.subThoroughfare != nil) { // Number on the road
                        subThoroughfare = p.subThoroughfare!
                    }
                    
                    dispatch_async(dispatch_get_main_queue(), {
                                                //Road on which we r in
                        self.addressLabel.text = "\(subThoroughfare) \(p.thoroughfare) \n \(p.subLocality) \n \(p.locality)\n \(p.subAdministrativeArea) \n \(p.postalCode) \n \(p.country)"
                    })
                    
                }
            }
        })
        
        
        
    }

}

