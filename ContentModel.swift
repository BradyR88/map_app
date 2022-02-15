//
//  ContentModel.swift
//  City SIghts
//
//  Created by Brady Robshaw on 2/15/22.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManager = CLLocationManager()
    
    override init() {
        
        // init method of NSObject
        super.init()
        
        // set content model as the delegate of the location manage
        locationManager.delegate = self
        
        // request permition for the user
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    // MARK: Location manager delegate methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            
            // we have permition
            // start Gio locating the user
            locationManager.startUpdatingLocation()
        }
        else if locationManager.authorizationStatus == .denied {
            // we don't have permition
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // give us the location of the user
        print(locations.first ?? "No Location")
        
        // stop requesting the location after we git it once
        locationManager.stopUpdatingLocation()
        
    }
}
