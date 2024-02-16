//
//  File.swift
//  
//
//  Created by Rodney Dyer on 2/10/24.
//

import Foundation

struct CategoricalData: Identifiable {
    let id = UUID()
    var category: String
    var value: Double
}



extension CategoricalData {
    
    static var defaultCategoricalData: [CategoricalData] {
        var ret = [CategoricalData]()
        ret.append( CategoricalData( category: "Category 1", 
                                     value: Double.random(in: 10.0...20.0)) )
        ret.append( CategoricalData( category: "Category 2", 
                                     value: Double.random(in: 10.0...20.0)) )
        ret.append( CategoricalData( category: "Category 3", 
                                     value: Double.random(in: 10.0...20.0)) )
        ret.append( CategoricalData( category: "Category 4", 
                                     value: Double.random(in: 10.0...20.0)) )
        ret.append( CategoricalData( category: "Category 5", 
                                     value: Double.random(in: 10.0...20.0)) )
        return ret
    }
    
}
