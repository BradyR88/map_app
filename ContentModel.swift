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
        let userLocation = locations.first
        
        if userLocation != nil {
            // we have a location
            // stop requesting the location after we git it once
            locationManager.stopUpdatingLocation()
            
            // if we have the coordinates of the user send info to yelp API
            getBusinesses(category: "restaurants", location: userLocation!)
        }
        
        
        
        // MARK: yelp API Methods
        
        func getBusinesses(category:String, location: CLLocation) {
            // create url
            let urlString = "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
            let url = URL(string: urlString)
            
            if let url = url {
                // create url request
                var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
                request.httpMethod = "GET"
                request.addValue("Bearer 7GTO4GaNfVecl8JUVfHteNi-DtEuww4dfjrGnL4wr64yTWqilEYMeqpnjUqGgCvKbqIl9v-_CC0cIAYCNXQIJ1Hvcb-5jL6jAnlRqbcSkQZgP5R_tCOZRt3nOc0LYnYx", forHTTPHeaderField: "Authorization")
                
                // get URLSession
                let session = URLSession.shared
                
                // create data task
                let dataTask = session.dataTask(with: request) { (data, response, error) in
                    // check if there isn't an error
                    if error == nil {
                        //print(response)
                    }
                }
                
                // start data task
                dataTask.resume()
            }
        }
    }
}
