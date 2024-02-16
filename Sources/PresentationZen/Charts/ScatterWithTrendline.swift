//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 2/10/24.
//

import Charts
import SwiftUI

struct ScatterPlotWithTrendline: View {
    var data: [PointData]
    var xLabel: String
    var yLabel: String
    var lineSlope: Double
    var lineInterscept: Double
    var lineColor: Color = .red
    
    var xrange: (Double,Double) {
        let vals: [Double] = data.compactMap( { $0.xValue }).sorted()
        return (vals[0], vals[(vals.count-1)])
    }
    
    var yrange: (Double, Double) {
        let vals: [Double] = data.compactMap( { $0.yValue }).sorted()
        return (vals[0], vals[(vals.count-1)])
    }
    
    
    
    var body: some View {
        Chart {
            
            ForEach( data ) {
                PointMark(
                    x: .value("X Axis", $0.xValue ),
                    y: .value("Y Axis", $0.yValue )
                )
            }
            
            //RuleMark(a)
            
        }
        .chartXAxisLabel(position: .bottom,
                         alignment: .center,
                         content: {
            Text(xLabel)
                .font(.title3)
        } )
        .chartYAxisLabel(position: .trailing,
                         alignment: .center,
                         content: {
            Text(yLabel)
                .font(.title3)
        } )
        
    }
}

#Preview {
    ScatterPlotWithTrendline( data: PointData.defaultPointData,
                              xLabel: "Default X-Axis Label",
                              yLabel: "Default Y-Axis Label",
                              lineSlope: 4.5,
                              lineInterscept: 0.0 )
}
