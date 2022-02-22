//
//  LaunchView.swift
//  City SIghts
//
//  Created by Brady Robshaw on 2/15/22.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        // detect the authorization status of Joe locating the user
        
        if model.authorizationState == .notDetermined {
            // if undetermined show onboarding
            OnboardongView()
        }
        else if model.authorizationState == .authorizedWhenInUse || model.authorizationState == .authorizedAlways {
            // If approved show Homeview
            HomeView()
        }
        else {
            // if denied show denied skrean
            LocationDeniedView()
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
            .environmentObject(ContentModel())
    }
}
