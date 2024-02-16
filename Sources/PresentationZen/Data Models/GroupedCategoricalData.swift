//
//  File.swift
//  
//
//  Created by Rodney Dyer on 2/10/24.
//

import Foundation

struct GroupedCategoricalData: Identifiable {
    let id = UUID()
    var group: String
    var category: String
    var value: Double
}



extension GroupedCategoricalData {
    
    static var defaultGroupedCategoricalData: [GroupedCategoricalData] {
        var ret = [GroupedCategoricalData]()
        
        for i in 1 ... 4 {
            let group = String("Group \(i)")
            for j in 1 ... 4 {
                let val = GroupedCategoricalData(group: group,
                                                 category: String("Category \(j)"),
                                                 value: Double.random(in: 0.0...1.0) )
                ret.append( val )
            }
        }
        return ret
    }
}
