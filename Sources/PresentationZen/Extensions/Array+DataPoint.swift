//
//  File.swift
//  
//
//  Created by Rodney Dyer on 2024-02-16.
//

import Foundation


public extension Array where Element == DataPoint {
    

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

    
    /// Convert raw data to vector for histogram
    ///
    /// This takes a raw set of data and returns a new set where the y-value is the c
    ///   count of observations in the binned values of the x-axis data.
    ///
    ///  - Parameters:
    ///     - binSize: The size of the bin as a ``Double``
    ///  - Returns: A new set of data with counts as each bin.
    func histogram( binSize: Double = 0.01 ) -> [DataPoint] {
        var ret = [DataPoint]()
        
        for value in self {
            let xBin = round( value.xValue / binSize ) * binSize

            /// One already exists with same category
            if let idx = ret.firstIndex(where: { $0.xValue == xBin && $0.category == value.category } ) {
                ret[idx].yValue = ret[idx].yValue + 1.0
            } else {
                ret.append( DataPoint(x: xBin, y: 1.0, category: value.category))
            }
        }
        
        
        return ret.sorted { $0.xValue < $1.xValue && $0.category < $1.category }
    }
    
    
    /// Convert raw data to counts of points in bins
    ///
    /// This takes the raw data and partitions it into bins on the x-value and then changes the y-value
    ///   to the count so that they can be plot as a stack of balls.
    ///
    /// - Parameters:
    ///     - minSize: A ``Double`` indicating the width of the bins.
    ///     - xMin: The minimum value on the x-axis (where to start) as a ``Double``
    
    
    
    
}
