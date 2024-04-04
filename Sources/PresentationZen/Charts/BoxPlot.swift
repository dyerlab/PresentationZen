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
    
    init( data: [DataPoint] ) {
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
                    width: .fixed( 5.0 )
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
                    yStart: .value("BoxBottom", (item.median - 1.0) ),
                    yEnd: .value("BoxBottom", (item.median + 1.0) )
                )
                .foregroundStyle( Color.secondary.opacity(0.75) )

            }
        }
    }
}

#Preview {
    BoxPlot( data: DataPoint.defaultDataPoints )
}
