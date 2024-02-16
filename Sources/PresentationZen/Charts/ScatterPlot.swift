//
//  SwiftUIView.swift
//
//
//  Created by Rodney Dyer on 2/10/24.
//

import Charts
import SwiftUI

struct ScatterPlot: View {
    var data: [DataPoint]
    var xLabel: String
    var yLabel: String
    var showLabel: Bool = false
    var showGroups: Bool = false
    
    var body: some View {
        Chart {
            ForEach( data, id: \.self) { item in
                if showLabel {
                    if showGroups {
                        PointMark(
                            x: .value("X Value", item.xValue  ),
                            y: .value("Y Value", item.yValue ) )
                        .foregroundStyle(by: .value( "Group",
                                                     item.grouping ) )
                        .annotation {
                            Text("\(item.label )")
                                .font( .footnote )
                        }
                    } else {
                        PointMark(
                            x: .value("X Value", item.xValue  ),
                            y: .value("Y Value", item.yValue ) )
                        .annotation {
                            Text("\(item.label )")
                                .font( .footnote )
                        }
                    }
                } else {
                    if showGroups {
                        PointMark(
                            x: .value("X Value", item.xValue  ),
                            y: .value("Y Value", item.yValue ) )
                        .foregroundStyle(by: .value("Group", showGroups ? item.grouping : "" ) )
                    } else {
                        PointMark(
                            x: .value("X Value", item.xValue  ),
                            y: .value("Y Value", item.yValue ) )
                    }
                }
            }
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
        .chartLegend(position: .top)
    }
}

#Preview {
    VStack(spacing: 25) {
        ScatterPlot( data: DataPoint.defaultDataPoints,
                     xLabel: "Default X-Axis Label",
                     yLabel: "Default Y-Axis Label" )
        
        ScatterPlot( data: DataPoint.defaultDataPoints,
                     xLabel: "Default X-Axis Label",
                     yLabel: "Default Y-Axis Label",
                     showLabel: true )
        
        ScatterPlot( data: DataPoint.defaultDataPoints,
                     xLabel: "Default X-Axis Label",
                     yLabel: "Default Y-Axis Label",
                     showGroups: true )
        
        ScatterPlot( data: DataPoint.defaultDataPoints,
                     xLabel: "Default X-Axis Label",
                     yLabel: "Default Y-Axis Label",
                     showLabel: true,
                     showGroups: true  )
    }
    .frame( minHeight: 800 )
    .padding()
}
