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
    public var xLabel: String
    public var legendVisibility: Visibility {
        let categories = Set<String>( data.compactMap({ $0.category } ) )
        if categories.count < 2 {
            return .hidden
        } else {
            return .automatic
        }
    }
    
    
    
    public init(data: [DataPoint], yLabel: String, xLabel: String = "", ordinal: Bool = false ) {
        self.data = data
        self.yLabel = yLabel
        self.ordinal = ordinal
        
        if xLabel.isEmpty {
            self.xLabel = self.ordinal == true ? "Ordinal" : "Time"
        } else {
            self.xLabel = xLabel
        }
            
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
        .chartLegend( self.legendVisibility )
        .chartXAxisLabel(position: .bottom,
                         alignment: .center,
                         content: {
            Text("\(xLabel)")
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

#Preview("Date") {
        TimeSeriesPlot(data: DataPoint.defaultDataPoints,
                       yLabel: "Y-Axis Data" )
        .padding()
}

#Preview("Ordinal"){
    TimeSeriesPlot(data: DataPoint.defaultDataPoints,
                   yLabel: "Y-Axis Data",
                   ordinal: true )
    .padding()
}


#Preview("No Categories") {
    TimeSeriesPlot(data: DataPoint.defaultDataPointsNoMetaData,
                   yLabel: "Y-Axis Data",
                   ordinal: true )
    .padding()
}
