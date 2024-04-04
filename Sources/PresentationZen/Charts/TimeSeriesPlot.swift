//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 2024-04-03.
//

import Charts
import SwiftUI

public struct TimeSeriesPlot: View {
    public var data: [DataPoint]
    public var yLabel: String
    public var ordinal: Bool
    
    public init(data: [DataPoint], yLabel: String, ordinal: Bool = false ) {
        self.data = data
        self.yLabel = yLabel
        self.ordinal = ordinal
    }
    
    public var body: some View {
        Chart {
            ForEach( data ) { item in
            
                if ordinal {
                    LineMark(
                        x: .value("X Value", item.xValue ),
                        y: .value(yLabel, item.yValue)
                    )
                    .foregroundStyle( .gray )
                    .lineStyle( .init(dash: [5.0, 5.0 ]))
                    
                    PointMark(
                        x: .value("X Value", item.xValue),
                        y: .value(yLabel, item.yValue)
                    )
                    .foregroundStyle(by: .value("Category", item.category) )
                } else {
                    
                    if item.date != nil {
                        LineMark(
                            x: .value("X Value", item.date! ),
                            y: .value(yLabel, item.yValue)
                        )
                        .foregroundStyle( .gray )
                        .lineStyle( .init(dash: [5.0, 5.0 ]))
                        
                        PointMark(
                            x: .value("X Value", item.date!),
                            y: .value(yLabel, item.yValue)
                        )
                        .foregroundStyle(by: .value("Category", item.category) )
                    }
                    
                }
            }
            
        }
        .chartXAxisLabel(position: .bottom,
                         alignment: .center,
                         content: {
            Text("\(self.ordinal == true ? "Ordinal" : "Time")")
                .font(.headline)
        } )
        .chartYAxisLabel(position: .trailing,
                         alignment: .center,
                         content: {
            Text(yLabel)
                .font(.title3)
        } )
        .frame( minHeight: 300)
        
    }
}

#Preview {
    List {
        TimeSeriesPlot(data: DataPoint.defaultDataPoints,
                       yLabel: "Y-Axis Data" )
        
        TimeSeriesPlot(data: DataPoint.defaultDataPoints,
                       yLabel: "Y-Axis Data",
                       ordinal: true )
    }

}
