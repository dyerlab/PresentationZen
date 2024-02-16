//
//  File.swift
//  
//
//  Created by Rodney Dyer on 2/10/24.
//

import Foundation

struct PointData: Identifiable {
    let id = UUID()
    var xValue: Double
    var yValue: Double
}


extension PointData {
    
    static var defaultPointData: [PointData] {
        var ret = [PointData]()
        for _ in 0 ..< 20 {
            ret.append( PointData( xValue: Double.random(in: 0.0...100.0),
                                   yValue: Double.random(in: 0.0...100.0)) )
        }
        return ret
    }
}
