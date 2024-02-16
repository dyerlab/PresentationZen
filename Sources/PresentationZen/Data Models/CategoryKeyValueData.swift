//
//  File.swift
//  
//
//  Created by Rodney Dyer on 2/10/24.
//

import Foundation

struct CategoryKeyValueData: Identifiable {
    let id = UUID()
    var category: String
    var key: String
    var value: String
    
}


extension CategoryKeyValueData {
    
    static var defaultCategoryKeyValueData: [CategoryKeyValueData] {
        var ret = [CategoryKeyValueData]()
        for c in 0 ..< 3 {
            let category = String("Categroy \(c)")
            for i in 0 ..< 5 {
                ret.append( CategoryKeyValueData( category: category,
                                                  key: String("Key \(i+1)"),
                                                  value: String("Value \(i+1)")) )
            }
        }
        return ret
    }
    
    
}
