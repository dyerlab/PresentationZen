//
//  File.swift
//  
//
//  Created by Rodney Dyer on 5/6/24.
//

import Foundation

public struct BoxPlotPoint: Identifiable, Hashable {
    public let id: UUID
    public var category: String
    public var median: Double
    public var sd: Double
    
    public init( points: [DataPoint] )  {
        self.id = UUID()
        self.median = points.compactMap({ $0.yValue}).median()
        self.sd = points.compactMap( { $0.yValue } ).sd()
        if let val = points.first {
            self.category = val.category
        } else {
            self.category = "undefined"
        }
    }
    
    
    
}
