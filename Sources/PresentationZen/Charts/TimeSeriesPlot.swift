//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 2024-04-03.
//

import Charts
import SwiftUI

struct TimeSeriesPlot: View {
    public var data: [DataPoint]
    public var yLabel: String
    public var showGroups: Bool
    
    public init(data: [DataPoint], yLabel: String, showGroups: Bool = false ) {
        self.data = data
        self.yLabel = yLabel
        self.showGroups = showGroups
    }
    
    var body: some View {
        Chart {
            ForEach( data ) { item in
            
                if item.date != nil {
                    LineMark(
                        x: .value("X Value", item.date! ),
                        y: .value(yLabel, item.yValue)
                    )
                }
                
            }
        }
    }
}

#Preview {
    TimeSeriesPlot(data: DataPoint.defaultDataPoints,
                   yLabel: "Y-Axis Data",
                   showGroups: false )
}
