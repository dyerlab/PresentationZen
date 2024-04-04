//
//  File.swift
//  
//
//  Created by Rodney Dyer on 4/3/24.
//

import Foundation


public struct BoxPlotPoint: Identifiable, Hashable {
    public let id: UUID
    public var category: String
    public var median: Double
    public var sd: Double
    
    
    
    init( points: [DataPoint] )  {
        self.id = UUID()
        
    }
    
}
