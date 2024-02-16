//
//  File.swift
//
//
//  Created by Rodney Dyer on 2024-02-16.
//

import Foundation

struct DataPoint: Identifiable, Hashable {
    let id = UUID()
    let label: String
    let category: String
    let grouping: String
    var xValue: Double
    var yValue: Double
    
    /// Default x,y point initializer
    init(x: Double, y: Double, label: String = "", group: String = "", category: String = "") {
        self.xValue = x
        self.yValue = y
        self.label = label
        self.grouping = group
        self.category = category
    }
    
    /// Default category,y initializer
    init( category: String, value: Double, label: String = "", group: String = "") {
        self.category = category
        self.yValue = value
        self.label = label
        self.grouping = group
        self.xValue = Double.nan
    }
    
}




extension DataPoint {
    
    static var defaultDataPoints: [DataPoint] {
        var ret = [DataPoint]()
        for i in 0 ..< 10 {
            ret.append( DataPoint( x: Double.random(in: 0.0...100.0),
                                   y: Double.random(in: 0.0...100.0),
                                   label: String("Label \(i+1)"),
                                   group: String("Group \( (i % 3) + 1)"),
                                   category: String("Category \( (i % 2)+1)") ) )
        }
        return ret
    }
        
}