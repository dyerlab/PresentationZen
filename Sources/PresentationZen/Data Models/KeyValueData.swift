//
//  File.swift
//  
//
//  Created by Rodney Dyer on 2/10/24.
//

import Foundation

struct KeyValueData: Identifiable {
    let id = UUID()
    var key: String
    var value: String
}




extension KeyValueData {
    static var defaultKeyValueData: [KeyValueData] {
        var ret = [KeyValueData]()
        for i in 0 ..< 10 {
            ret.append( KeyValueData( key: String("Key \(i+1)"),
                                      value: String("Value \(i+1)")))
        }
        return ret
    }
}
