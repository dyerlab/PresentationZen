//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 2/10/24.
//

import Charts
import SwiftUI

struct BarPlot: View {
    var data: [CategoricalData]
    var xLabel: String = "Categories"
    var yLabel: String = "Value"
    
    var body: some View {
        Chart {
            ForEach( data ) {
                BarMark(x: .value("Category", $0.category),
                        y: .value("Value", $0.value) )
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
}

#Preview {
    BarPlot( data: CategoricalData.defaultCategoricalData,
             xLabel: "Default Categories",
             yLabel: "Random Values" )
    .padding()
}
