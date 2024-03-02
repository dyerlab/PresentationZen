//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 2/10/24.
//

import Charts
import SwiftUI

public struct ScatterPlotWithTrendline: View {
    public var data: [DataPoint]
    public var xLabel: String
    public var yLabel: String
    public var lineSlope: Double
    public var lineInterscept: Double
    public var lineColor: Color
    
    var trendlinePoints: [DataPoint] {
        return data.trendlinePoints( intercept: lineInterscept,
                                     slope: lineSlope )
    }
    
    public init(data: [DataPoint], xLabel: String, yLabel: String, lineSlope: Double, lineInterscept: Double, lineColor: Color = .red) {
        self.data = data
        self.xLabel = xLabel
        self.yLabel = yLabel
        self.lineSlope = lineSlope
        self.lineInterscept = lineInterscept
        self.lineColor = lineColor
    }
    
    
    public var body: some View {
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
