//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 2/10/24.
//

import Charts
import SwiftUI

struct ScatterPlot: View {
    var data: [PointData]
    var xLabel: String
    var yLabel: String
    
    var body: some View {
        Chart( data ) {
            PointMark(
                x: .value("X Axis", $0.xValue ),
                y: .value("Y Axis", $0.yValue )
            )
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
    ScatterPlot( data: PointData.defaultPointData,
                 xLabel: "Default X-Axis Label",
                 yLabel: "Default Y-Axis Label" )
    .padding()
}
