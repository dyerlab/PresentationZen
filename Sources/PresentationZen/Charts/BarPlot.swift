//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 2/10/24.
//

import Charts
import SwiftUI

public struct BarPlot: View {
    public var data: [DataPoint]
    public var xLabel: String
    public var yLabel: String
    public var showLabel: Bool
    public var showGroups: Bool
    
    public init(data: [DataPoint], 
                xLabel: String = "Categories", yLabel: String = "Value",
                showLabel: Bool = false,
                showGroups: Bool = false) {
        self.data = data
        self.xLabel = xLabel
        self.yLabel = yLabel
        self.showLabel = showLabel
        self.showGroups = showGroups
    }
    
    
    public var chart: some View {
        Chart {
            ForEach( data, id: \.self) { item in
                if showLabel {
                    if showGroups {
                        BarMark(x: .value("Category",   item.category ),
                                y: .value("Value",      item.yValue ) )
                        .foregroundStyle(by: .value("Group", item.grouping ) )
                        .annotation {
                            Text("\(item.label)")
                                .font( .footnote )
                        }
                    } else {
                        BarMark(x: .value("Category",   item.category ),
                                y: .value("Value",      item.yValue ) )
                        .annotation {
                            Text("\(item.label)")
                                .font( .footnote )
                        }
                    }
                } else {
                    if showGroups {
                        BarMark(x: .value("Category",   item.category ),
                                y: .value("Value",      item.yValue ) )
                        .foregroundStyle(by: .value("Group", showGroups ? item.grouping : "" ) )
                    } else {
                        BarMark(x: .value("Category",   item.category ),
                                y: .value("Value",      item.yValue ) )
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
    }
    
    
    public var body: some View {
        if self.showGroups {
            self.chart
                .chartLegend(position: .top)
        } else {
            self.chart
        }
    }
}

#Preview {
    VStack(spacing: 25) {
        BarPlot( data: DataPoint.defaultDataPoints,
                 xLabel: "Default Categories",
                 yLabel: "Random Values" )

        BarPlot( data: DataPoint.defaultDataPoints,
                 xLabel: "Default Categories",
                 yLabel: "Random Values",
                 showLabel: true )
        
        
        BarPlot( data: DataPoint.defaultDataPoints,
                 xLabel: "Default Categories",
                 yLabel: "Random Values",
                 showGroups: true )

        BarPlot( data: DataPoint.defaultDataPoints,
                 xLabel: "Default Categories",
                 yLabel: "Random Values",
                 showLabel: true,
                 showGroups: true )
    }
    .frame( minHeight: 800 )
    .padding()
    
    
}
