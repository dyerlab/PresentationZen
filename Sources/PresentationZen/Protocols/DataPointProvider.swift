//
//  File.swift
//  
//
//  Created by Rodney Dyer on 2/17/24.
//

import Foundation


/**
 Protocol indicating that the object produces data types of some sort.
 */
public protocol DataPointProvider {
    
    /// Sole variable required to be a DataPointProvider
    var dataPoints: [DataPoint] { get }
    
}
