//
//  DashedDivider.swift
//  City SIghts
//
//  Created by Brady Robshaw on 2/22/22.
//

import SwiftUI

struct DashedDivider: View {
    var body: some View {
        
        GeometryReader { geom in
            Path { path in
                path.move(to: CGPoint.zero)
                path.addLine(to: CGPoint(x: geom.size.width, y: 0))
            }
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .foregroundColor(.gray)
        }
        .frame(height: 1)
        
        
        
    }
}

struct DashedDivider_Previews: PreviewProvider {
    static var previews: some View {
        DashedDivider()
    }
}
