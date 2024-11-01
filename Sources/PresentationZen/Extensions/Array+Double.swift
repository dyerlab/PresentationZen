//
//  File.swift
//
//
//  Created by Rodney Dyer on 4/4/24.
//

import Foundation


public extension Array where Element == Double {
    
    /// Sum of the elements in the aray
    func sum() -> Double {
        return self.reduce(0, +)
    }
    
    /// Mean of the values
    func mean() -> Double {
        return self.sum() / Double(self.count)
    }
    
    /// Median of the arrays values
    func median() -> Double {
        let vals = self.sorted()
        if vals.count % 2 == 0 {
            return Double((vals[(vals.count / 2)] + vals[(vals.count / 2) - 1])) / 2
        } else {
            return Double(vals[(vals.count - 1) / 2])
        }
    }
    
    /// The population standard deviation
    func sd() -> Double {
        let mean = self.mean()
        let v = self.reduce(0, { $0 + ($1-mean)*($1-mean) })
        return sqrt(v / (Double(self.count) - 1))
    }
    
    /// Take double and return dictionary of counts
    var discretize: [Double: Int] {
        var ret = [Double: Int]()
        for value in self {
            ret[value, default: 0] += 1
        }
        return ret
    }
    
}
