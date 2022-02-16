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
    
    @Published var authorizationState = CLAuthorizationStatus.notDetermined
    
    @Published var restaurants = [Business]()
    @Published var sights = [Business]()
    
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
        
        self.authorizationState = locationManager.authorizationStatus
        
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
            getBusinesses(category: Constants.sightsKey, location: userLocation!)
            getBusinesses(category: Constants.restaurantsKey, location: userLocation!)
        }
        
        
        
        // MARK: yelp API Methods
        
        func getBusinesses(category:String, location: CLLocation) {
            // create url
            let urlString = "\(Constants.apiUrl)\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
            let url = URL(string: urlString)
            
            if let url = url {
                // create url request
                var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
                request.httpMethod = "GET"
                request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
                
                // get URLSession
                let session = URLSession.shared
                
                // create data task
                let dataTask = session.dataTask(with: request) { (data, response, error) in
                    // check if there isn't an error
                    if error == nil {
                        // parse the json
                        do {
                            let decoder = JSONDecoder()
                            let result = try decoder.decode(BusinessSearch.self, from: data!)
                            
                            DispatchQueue.main.async {
                                // assign results to appropriate property
                                if category == Constants.sightsKey {
                                    self.sights = result.businesses
                                }
                                else if category == Constants.restaurantsKey {
                                    self.restaurants = result.businesses
                                }
                            }
                        }
                        catch {
                            print(error)
                        }
                    }
                }
                
                // start data task
                dataTask.resume()
            }
        }
    }
}
