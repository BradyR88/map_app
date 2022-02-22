//
//  LocationDeniedView.swift
//  City SIghts
//
//  Created by Brady Robshaw on 2/22/22.
//

import SwiftUI

struct LocationDeniedView: View {
    
    private let backgroundcolor = Color(red: 34/255, green: 141/255, blue: 138/255)
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            Text("Whoops!")
                .bold()
                .font(.title)
            
            Text("We need to access your location to provide you with the best sites in the city change your decision at any time in Settings.")
            
            Spacer()
            
            Button {
                // open the setings
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    if UIApplication.shared.canOpenURL(url){
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            } label: {
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    Text("Go to Settings")
                        .bold()
                        .foregroundColor(backgroundcolor)
                }
            }
            .padding();
        }
        .padding(.horizontal)
        .multilineTextAlignment(.center)
        .foregroundColor(.white)
        .background(backgroundcolor)
    }
}

struct LocationDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeniedView()
    }
}
