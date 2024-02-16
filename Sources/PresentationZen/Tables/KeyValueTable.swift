//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 2/10/24.
//
import SwiftUI

struct KeyValueTable: View {
    var data: [DataPoint]
    var columnTypes: [DataColumnType]
    var columnHeaders: [String] = [ "Category",
                                    "Grouping",
                                    "Label",
                                    "X",
                                    "Y" ]
    
    var body: some View {
        
        Table(data) {
            TableColumn( "Grouping", value: \.grouping)
            TableColumn( "Label", value: \.label)
            TableColumn( "Category", value: \.category)
            TableColumn( "X" ) { item in
                Text("\(item.xValue)")
            }
            TableColumn( "Y" ) { item in
                Text("\(item.yValue)")
            }
        }
        
    }
    
}

#Preview {
    KeyValueTable( data: DataPoint.defaultDataPoints,
                   columnTypes: [.grouping, .label, .category, .xValue, .yValue],
                   columnHeaders: ["Grouping","Label","Category","X","Y"] )
    .padding()
}

