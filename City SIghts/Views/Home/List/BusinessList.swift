//
//  BusinessList.swift
//  City SIghts
//
//  Created by Brady Robshaw on 2/16/22.
//

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView (showsIndicators: false){
            LazyVStack (alignment: .leading, pinnedViews: [.sectionHeaders]){
                
                BusinessSection(sectionName: "Restaurants", businesses: model.restaurants)
                BusinessSection(sectionName: "Sights", businesses: model.sights)
                
            }
        }
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList()
    }
}
