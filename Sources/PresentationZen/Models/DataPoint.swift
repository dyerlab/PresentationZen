//
//  File.swift
//
//
//  Created by Rodney Dyer on 2024-02-16.
//

import Foundation

public struct DataPoint: Identifiable, Hashable {
    public let id = UUID()
    public let label: String
    public let category: String
    public let grouping: String
    public var xValue: Double
    public var yValue: Double
    public var date: Date?
    
    /// Default x,y point initializer
    public init(x: Double, y: Double, label: String = "", group: String = "", category: String = "") {
        self.xValue = x
        self.yValue = y
        self.label = label
        self.grouping = group
        self.category = category
    }
    
    /// Default category,y initializer
    public init( category: String, value: Double, label: String = "", group: String = "", date: Date? = nil ) {
        self.category = category
        self.yValue = value
        self.label = label
        self.grouping = group
        self.xValue = Double.nan
        self.date = date
    }
    
}




extension DataPoint {
    
    public static var defaultDataPoints: [DataPoint] {
        var ret = [DataPoint]()
        for i in 0 ..< 10 {
            var pt = DataPoint( x: Double.random(in: 0.0...100.0),
                                y: Double.random(in: 0.0...100.0),
                                label: String("Label \(i+1)"),
                                group: String("Group \( (i % 3) + 1)"),
                                category: String("Category \( (i % 2)+1)") )
            let time = Double(i) * -86400.0
            pt.date = Date.now.addingTimeInterval( time )
            ret.append( pt )
        }
        return ret
    }
        
}
