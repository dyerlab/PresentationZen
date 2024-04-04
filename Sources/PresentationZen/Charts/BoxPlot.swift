//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 4/4/24.
//

import Charts
import SwiftUI

struct BoxPlot: View {
    
    var boxes: [BoxPlotPoint]
    var xLabel: String
    var yLabel: String
    
    init( data: [DataPoint], xLabel: String, yLabel: String ) {
        self.xLabel = xLabel
        self.yLabel = yLabel
        
        let cats = Array<String>( Set<String>(data.compactMap({$0.category})) )
        var theBoxes = [BoxPlotPoint]()
        for cat in cats {
            theBoxes.append(  BoxPlotPoint(points: data.filter({ $0.category == cat})) )
        }
        
        self.boxes = theBoxes.sorted(by: { $0.category < $1.category })
        
    }
    
    
    var body: some View {
        Chart {
            ForEach( boxes ) { item in
                
                // The Line
                BarMark(
                    x: .value("Category", item.category),
                    yStart: .value("BoxBottom", (item.median - 2.0*item.sd) ),
                    yEnd: .value("BoxBottom", (item.median + 2.0*item.sd) ),
                    width: .fixed( 3.0 )
                )
                .foregroundStyle( Color.secondary.opacity(0.75) )
                
                // The Box
                BarMark(
                    x: .value("Category", item.category),
                    yStart: .value("BoxBottom", (item.median - item.sd) ),
                    yEnd: .value("BoxBottom", (item.median + item.sd) )
                )

                
                // The Median
                BarMark(
                    x: .value("Category", item.category),
                    yStart: .value("BoxBottom", (item.median - 0.5) ),
                    yEnd: .value("BoxBottom", (item.median + 0.5) )
                )
                .foregroundStyle( Color.secondary.opacity(0.75) )

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
    BoxPlot( data: DataPoint.defaultDataPoints,
             xLabel: "Categories",
             yLabel: "Values"
    )
}
