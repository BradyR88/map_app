//
//  BusinessDetail.swift
//  City SIghts
//
//  Created by Brady Robshaw on 2/17/22.
//

import SwiftUI

struct BusinessDetail: View {
    
    var business: Business
    
    var body: some View {
        
        VStack (alignment: .leading){
            
            VStack(alignment: .leading, spacing: 0) {
                GeometryReader() { geom in
                    
                    // Business image
                    let  uiImage = UIImage(data: business.imageData ?? Data())
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: geom.size.width , height: geom.size.height)
                        .clipped()
                }
                .ignoresSafeArea(.all, edges: .top)
                
                // Open closed indicator
                ZStack (alignment: .leading) {
                    Rectangle()
                        .frame(height: 36)
                        .foregroundColor(business.isClosed! ? .gray : .blue)
                    Text(business.isClosed! ? "Closed" : "Open")
                        .foregroundColor(.white)
                        .bold()
                        .padding(.leading)
                }
            }
            
            Group {
                // Business name
                Text(business.name!)
                    .font(.largeTitle)
                    .padding()
                
                // Address
                if business.location?.displayAddress != nil {
                    ForEach(business.location!.displayAddress!, id: \.self) { address in
                        Text(address)
                            .padding(.horizontal)
                    }
                }
                // rating
                Image("regular_\(business.rating ?? 0.0)")
                    .padding()
                
                Divider()
                
                // phone number
                HStack {
                    Text("Phone:")
                        .bold()
                    Text(business.displayPhone ?? "")
                    Spacer()
                    Link("Call", destination: URL(string: "tel:\(business.phone ?? "")")!)
                }
                .padding()
                
                Divider()
                
                // reviews
                HStack {
                    Text("Reviews:")
                        .bold()
                    Text(String(business.reviewCount ?? 0))
                    Spacer()
                    Link("Read", destination: URL(string: "\(business.url ?? "")")!)
                }
                .padding()
                
                Divider()
                
                // website
                HStack {
                    Text("Website:")
                        .bold()
                    Text(business.url ?? "")
                    Spacer()
                    Link("Visit", destination: URL(string: "\(business.url ?? "")")!)
                }
                .padding()
                
                Divider()
            }
            
            // get directions button
            Button {
                // TODO: show directions
            } label: {
                ZStack {
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(.blue)
                        .cornerRadius(10)
                    
                    Text("Get Derections")
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .padding()

        }
        
    }
}

//struct BusinessDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        BusinessDetail()
//    }
//}
