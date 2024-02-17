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
    var columnHeaders: [String] = [ "Category Label",
                                    "Grouping Label",
                                    "Label",
                                    "X Value",
                                    "Y Value" ]
    
    
    var columns: [GridItem] {
        var ret = [GridItem]()
        for _ in 0 ..< columnTypes.count {
            ret.append( GridItem(.fixed(100) ) )
        }
        return ret
    }
    
    var body: some View {
        
        
        ScrollView( [.horizontal, .vertical]) {
            LazyVGrid( columns: self.columns, content: {
                ForEach( 0..<columnTypes.count, id: \.self ) { idx in
                    Text("\(columnHeaders[idx])")
                        .foregroundStyle( .selection )
                        .multilineTextAlignment( .center )
                }
                ForEach( data ) { item in
                    ForEach( columnTypes, id: \.self ) { type in

                        switch( type ) {
                        case .grouping:
                            Text("\(item.grouping)")
                        case .label:
                            Text("\(item.label)")
                        case .category:
                            Text("\(item.category)")
                        case .xValue:
                            Text("\(item.xValue)")
                        case .yValue:
                            Text("\(item.yValue)")
                        }
                    }
                }
            })
        }
        
        /*
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
        .cornerRadius(4.0)
         
        */
    }
    
}

#Preview {
    VStack(spacing: 25) {
        
        KeyValueTable( data: DataPoint.defaultDataPoints,
                       columnTypes: [.grouping, .label, .category, .xValue, .yValue],
                       columnHeaders: ["Grouping Label","Label","Category Label","X Value","Y Value"] )

        
        KeyValueTable( data: DataPoint.defaultDataPoints,
                       columnTypes: [ .label, .xValue, .grouping,  .yValue],
                       columnHeaders: ["Label","X","Grouping","Y Value"] )
        
    }
    .padding()
}

