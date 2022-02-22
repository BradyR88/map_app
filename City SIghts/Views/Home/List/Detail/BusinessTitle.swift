//
//  BusinessTitle.swift
//  City SIghts
//
//  Created by Brady Robshaw on 2/21/22.
//

import SwiftUI

struct BusinessTitle: View {
    
    var business: Business
    
    var body: some View {
        
        VStack (alignment: .leading) {
            // Business name
            Text(business.name!)
                .font(.title2)
                .bold()
            
            // Address
            if business.location?.displayAddress != nil {
                ForEach(business.location!.displayAddress!, id: \.self) { address in
                    Text(address)
                }
            }
            // rating
            Image("regular_\(business.rating ?? 0.0)")
        }
        
       
    }
}
