//
//  File.swift
//  
//
//  Created by Rodney Dyer on 2024-02-16.
//

import Foundation


extension Array where Element == DataPoint {
    

    /// Minimum values
    ///
    /// - Returns: minimum ``DataPoint`` values or ``Double.infinity``
    var minimum: DataPoint {
        var ret = DataPoint(x: Double.infinity,
                            y: Double.infinity )
        for item in self {
            if item.xValue < ret.xValue {
                ret.xValue = item.xValue
            }
            if item.yValue < ret.yValue {
                ret.yValue = item.yValue
            }
        }
        return ret
    }

    /// Maximum values
    ///
    /// - Returns: ``DataPoint`` with maximum values in array or ``-Double.infinity``
    var maximum: DataPoint {
        var ret = DataPoint(x: -Double.infinity,
                            y: -Double.infinity )
        for item in self {
            if item.xValue > ret.xValue {
                ret.xValue = item.xValue
            }
            if item.yValue > ret.yValue {
                ret.yValue = item.yValue
            }
        }
        return ret
    }
    
    
    /// Gets trendline end points for specificed line.
    ///
    /// This takes the data in the array of ``DataPoint`` objects and returns the endpoints for a
    ///  trendline defined by the slope and intercept passed to the function.
    ///
    /// - Parameters:
    ///     - intercept: A ``Double`` indicating where the line intercepts the y-axis at x=0.0
    ///     - slope: A ``Double`` indicates the slope of the trendline.
    /// - Returns: The pair of points for line from minimum X to maximum X.
    func trendlinePoints(intercept: Double, slope: Double) -> [DataPoint] {
        let mn = self.minimum
        let mx = self.maximum
        
        let pt1 = DataPoint(x: mn.xValue,
                            y: mn.xValue * slope + intercept,
                            group: "Trendline" )
        
        let pt2 = DataPoint(x: mx.xValue,
                            y: mx.xValue * slope + intercept,
                            group: "Trendline" )
        
        return [pt1, pt2]
    }

    
}
