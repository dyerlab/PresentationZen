//
//  SwiftUIView.swift
//
//
//  Created by Rodney Dyer on 2/10/24.
//

import Charts
import SwiftUI

struct GroupedBarPlot: View {
    var data: [GroupedCategoricalData]
    var xLabel: String
    var yLabel: String
    
    
    var body: some View {
        Chart( data ) {
            BarMark(
                x: .value("Category", $0.category),
                y: .value("Value", $0.value)
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
    GroupedBarPlot( data: GroupedCategoricalData.defaultGroupedCategoricalData,
                    xLabel: "Default Categories",
                    yLabel: "Random Values" )
    .padding()
}
