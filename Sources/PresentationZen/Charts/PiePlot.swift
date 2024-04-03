//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 2/17/24.
//

import SwiftUI
import Charts

public struct PiePlot: View {
    public var data: [DataPoint]
    public var title: String
    
    public init(data: [DataPoint], title: String = "" ) {
        self.data = data
        self.title = title
    }
    
    public var body: some View {
        ZStack {
        Chart( data) { datum in
            
            SectorMark(angle: .value(
                Text(verbatim: datum.label), datum.xValue),
                       innerRadius: .ratio(0.25),
                       angularInset: 1.5
            )
            .cornerRadius( 3 )
            .foregroundStyle(by: .value(
                Text(verbatim: datum.label),
                datum.label
            ))
            .annotation(position: .overlay){
                if datum.xValue != 0.0 {
                    Text(verbatim: datum.label)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .chartLegend(.hidden)
            Text("\(title)")
                .font(.title2)
        }
    }x
}

#Preview {
    VStack(spacing: 20) {
        PiePlot( data: DataPoint.defaultDataPoints,
                     title: "The title" )
        .padding()
    }

}
