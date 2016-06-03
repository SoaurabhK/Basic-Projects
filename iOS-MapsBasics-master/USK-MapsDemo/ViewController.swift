//
//  ViewController.swift
//  USK-MapsDemo
//
//  Created by Soaurabh Kakkar on 23/07/16.
//  Copyright © 2016 Soaurabh Kakkar. All rights reserved.
//

import UIKit
import MapKit //Contains all the methods/functions associated with Maps
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    // Note- We need to add CoreLocation.framework to access user's actual location(geolocation)
    //    and need to edit info.plist file(NSLocationWhenInUseUsageDescription -- Asking from user to get their location when the app is running, NSLocationAlwaysUsageDescription -- always whether app is running or in background) and need to add CLLocationManagerDelegate

    @IBOutlet weak var map: MKMapView!
    let locationManager:CLLocationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Requesting user's location
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // best location, uses the GPS
        locationManager.distanceFilter = 100.0 //Minimum distance for which a location update is sent
        locationManager.pausesLocationUpdatesAutomatically = false // Don't pause location updates automatically
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        //Zooming map to a particular location
        let latitude:CLLocationDegrees = 40.7
        
        let longitude:CLLocationDegrees = -73.9
        
        let latDelta:CLLocationDegrees = 0.01 // It's the difference of latitudes from one side of the screen to other(if this number is much smaller it will zooms in the location)
        let longDelta:CLLocationDegrees = 0.01
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        //Adding annotation to the map
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "My Custom Location"
        
        annotation.subtitle = "One day I'll go here..."
        
        map.addAnnotation(annotation)
        
        //Giving users the option to add annotations on long press
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.action(_:)))
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)

    }
    
    func action(geastureRecognizer:UIGestureRecognizer) {
        
        let touchPoint = geastureRecognizer.locationInView(self.map) //in terms of the screen, it's relative to the map in view(Not the actual coordinates in the world)
        
        let newCoordinate:CLLocationCoordinate2D = map.convertPoint(touchPoint, toCoordinateFromView: self.map)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoordinate
        
        annotation.title = "New Location"
        
        annotation.subtitle = "One day i'll go here"
        
        map.addAnnotation(annotation)
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //this method will be called everytime a new location is registered by the phone
        
        let userLocation:CLLocation = locations[0]
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        //let locationDirection:CLLocationDirection = userLocation.course
        //let userSpeed:CLLocationSpeed = userLocation.speed
        //let userAltitude:CLLocationDistance = userLocation.altitude
        
        let latDelta:CLLocationDegrees = 0.01 // It's the difference of latitudes from one side of the screen to other(if this number is much smaller it will zooms in the location)
        let longDelta:CLLocationDegrees = 0.01
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

