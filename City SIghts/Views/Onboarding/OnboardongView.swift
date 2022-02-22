//
//  OnboardongView.swift
//  City SIghts
//
//  Created by Brady Robshaw on 2/22/22.
//

import SwiftUI

struct OnboardongView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var tabSelection = 0
    
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    var body: some View {
        
        VStack {
            
            // tab view
            TabView(selection: $tabSelection) {
                // first tab
                VStack (spacing: 20) {
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    Text("Welcome to City Sites!")
                        .bold()
                        .font(.title)
                    Text("City Sites helps you find the best of the city!")
                }
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .tag(0)
                
                // second tab
                VStack (spacing: 20) {
                    Image("city1")
                        .resizable()
                        .scaledToFit()
                    Text("Ready to discover your city?")
                        .bold()
                        .font(.title)
                    Text("We'll show you the best restaurants, venues and more, based on your location!")
                        
                }
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .tag(1)
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            // Button
            Button {
                if tabSelection == 0 {
                    tabSelection = 1
                }
                else {
                    // request geolocation
                    model.requestGeolocationPermission()
                }
            } label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    Text( tabSelection == 0 ? "Next" : "Get My Location")
                }
            }
            .padding(.horizontal)
            .accentColor(tabSelection == 0 ? blue : turquoise)
            
        }
        .background(tabSelection == 0 ? blue : turquoise)
        
    }
}

struct OnboardongView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardongView()
    }
}
