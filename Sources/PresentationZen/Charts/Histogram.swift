//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 3/29/24.
//

import Charts
import SwiftUI
import SwiftData

/// This adds a public init on the sturctur.
public struct Histogram: View {
    public var xLabel: String = "Values"
    public var yLabel: String = "Count"
    public var data: [DataPoint]
    
    let curGradient = LinearGradient(
            gradient: Gradient (
                colors: [
                    Color(.blue).opacity(0.9),
                    Color(.blue).opacity(0.5)
                ]
            ),
            startPoint: .top,
            endPoint: .bottom
        )
    
    public init(xLabel: String, yLabel: String, data: [DataPoint]) {
        self.xLabel = xLabel
        self.yLabel = yLabel
        self.data = data
    }
    
    public var body: some View {
        Chart {
            ForEach( data ) { item in
                AreaMark(
                    x: .value("X-value", item.xValue ),
                    y: .value("Y-value", item.yValue)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(curGradient)
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
        .chartForegroundStyleScale(
                    range: Gradient (
                        colors: [
                            .purple,
                            .blue.opacity(0.3)
                        ]
                    )
                )

    }
}

#Preview {
    Histogram( xLabel: "Raw Data",
               yLabel: "Counts",
               data: DataPoint.DefaultHistogramDataPoints )
}
