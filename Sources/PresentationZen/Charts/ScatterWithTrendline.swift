//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 2/10/24.
//

import Charts
import SwiftUI

struct ScatterPlotWithTrendline: View {
    var data: [DataPoint]
    var xLabel: String
    var yLabel: String
    var lineSlope: Double
    var lineInterscept: Double
    var lineColor: Color = .red
    
    var trendlinePoints: [DataPoint] {
        return data.trendlinePoints( intercept: lineInterscept,
                                     slope: lineSlope )
    }
    
    var body: some View {
        Chart {
            // The trendline points
            ForEach( trendlinePoints ) {
                LineMark(
                    x: .value("X Axis", $0.xValue),
                    y: .value("Y Axis", $0.yValue)
                )
                .foregroundStyle( lineColor )
                .lineStyle( .init(dash: [5.0, 3.0 ]))
            }
            // The raw data
            ForEach( data ) {
                PointMark(
                    x: .value("X Axis", $0.xValue ),
                    y: .value("Y Axis", $0.yValue )
                )
            }
        }
        .chartXAxisLabel(position: .bottom,
                         alignment: .center,
                         content: {
            Text(xLabel)
                .font(.title3)
        })
        .chartYAxisLabel(position: .trailing,
                         alignment: .center,
                         content: {
            Text(yLabel)
                .font(.title3)
        })
    }
}

#Preview {
    
    ScatterPlotWithTrendline( data: DataPoint.defaultDataPoints,
                              xLabel: "Default X-Axis Label",
                              yLabel: "Default Y-Axis Label",
                              lineSlope: 0.75,
                              lineInterscept: 12.5 )
    .padding()
    
}
