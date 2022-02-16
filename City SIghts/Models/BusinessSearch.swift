//
//  BusinessSearch.swift
//  City SIghts
//
//  Created by Brady Robshaw on 2/15/22.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
}

struct Region: Decodable {
    var center = Coordinate()
}
