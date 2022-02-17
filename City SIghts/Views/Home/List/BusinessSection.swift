//
//  BusinessSection.swift
//  City SIghts
//
//  Created by Brady Robshaw on 2/16/22.
//

import SwiftUI

struct BusinessSection: View {
    
    var sectionName: String
    var businesses: [Business]
    
    var body: some View {
        
        Section (header: BusinessSectionHeader(title: sectionName)) {
            ForEach(businesses) { business in
                
                NavigationLink (destination: BusinessDetail(business: business)) {
                    BusinessRow(business: business)
                }
                
                
            }
        }
        
    }
}

//struct BusinessSection_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessSection()
//    }
//}
