//
//  HomeView.swift
//  City SIghts
//
//  Created by Brady Robshaw on 2/16/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            
            NavigationView {
                // determine if we should show list or map
                if !isMapShowing {
                    // show list
                    VStack (alignment: .leading) {
                        HStack {
                            Image(systemName: "location")
                            Text("Citty Name")
                            Spacer()
                            Text("Switch to map view")
                        }
                        Divider()
                        
                        BusinessList()
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                }
                else {
                    // show map
                    
                }
            }
        }
        else {
            // still waiting for data so show spinner
            ProgressView()
        }
        
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
