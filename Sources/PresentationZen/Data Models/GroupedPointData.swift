//
//  File.swift
//  
//
//  Created by Rodney Dyer on 2/10/24.
//

import Foundation

struct GroupedPointData: Identifiable {
    let id = UUID()
    var group: String
    var xValue: Double
    var yValue: Double
}



extension GroupedPointData {
    
    static var defaultGroupedPointData: [GroupedPointData] {
        var ret = [GroupedPointData]()
        for i in 1...4 {
            let group = String("Group \(i)")
            for _ in 0 ... 10 {
                let data = GroupedPointData( group: group,
                                             xValue: Double.random(in: 0.0...10.0),
                                             yValue: Double.random(in: 0.0...10.0))
                ret.append( data )
            }
        }
        return ret
    }
    
}
