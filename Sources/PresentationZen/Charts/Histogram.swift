//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 3/29/24.
//

import Charts
import SwiftUI
import SwiftData

struct Histogram: View {
    public var xLabel: String
    public var yLabel: String = "Count"

    var data: [DataPoint]
    var binSize: Double = 1.0
    
    var points: [DataPoint]  {
        return data.histogram(binSize: binSize).sorted { $0.xValue < $1.xValue && $0.category < $1.category   }
    }
    
    var body: some View {
        Chart {

            ForEach( points ) { item in
                
                BarMark(
                    x: .value("X-value", String("\(item.xValue)") ),
                    y: .value("Y-End", item.yValue)
                )
                .foregroundStyle(by: .value("Categroy", item.category))
                
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
    Histogram( xLabel: "Raw Data",
               yLabel: "Counts",
               data: DataPoint.defaultDataPoints,
               binSize: 20.0 )
}
