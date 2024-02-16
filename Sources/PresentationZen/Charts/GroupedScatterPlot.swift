//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 2/10/24.
//
import Charts
import SwiftUI

struct GroupedScatterPlot: View {
    var data: [GroupedPointData]
    var xLabel: String
    var yLabel: String
    
    
    var body: some View {
        Chart( data ) {
            PointMark(
                x: .value("X Axis", $0.xValue ),
                y: .value("Y Axis", $0.yValue)
            )
            .foregroundStyle(by: .value("Group", $0.group ) )
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
        .chartLegend( position: .top )
    }
}

#Preview {
    GroupedScatterPlot( data: GroupedPointData.defaultGroupedPointData,
                        xLabel: "Default X Label",
                        yLabel: "Default Y Label")
    .padding()
}
