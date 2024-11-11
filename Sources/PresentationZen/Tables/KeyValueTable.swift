//
//  SwiftUIView.swift
//
//
//  Created by Rodney Dyer on 2/10/24.
//
import SwiftUI

public struct KeyValueTable: View {
    public var data: [DataPoint]
    public var columnTypes: [DataColumnType]
    public var columnHeaders: [String] = [ "Category Label",
                                           "Grouping Label",
                                           "Label",
                                           "X Value",
                                           "Y Value",
                                           "Date" ]
    public var formatString: String
    public var minColWidth: Double
    
    public init( data: [DataPoint],
                 columnTypes: [DataColumnType],
                 columnHeaders: [String],
                 formatString: String = "%.4f",
                 minColWidth: Double = 150 ) {
        self.data = data
        self.columnTypes = columnTypes
        self.columnHeaders = columnHeaders
        self.formatString = formatString
        self.minColWidth = minColWidth
    }
    
    var columns: [GridItem] {
        var ret = [GridItem]()
        for _ in 0 ..< columnTypes.count {
            ret.append( GridItem(.flexible(minimum: minColWidth, maximum: .infinity) ) )
        }
        return ret
    }
    
    public var body: some View {
        
        
        ScrollView( [.horizontal, .vertical]) {
            LazyVGrid( columns: self.columns, content: {
                ForEach( 0..<columnTypes.count, id: \.self ) { idx in
                    Text("\(columnHeaders[idx])")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.headline)
                }
                ForEach( data ) { item in
                    ForEach( columnTypes, id: \.self  ) { type in
                        
                        switch( type ) {
                        case .grouping:
                            Text("\(item.grouping)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .lineLimit(1)
                        case .label:
                            Text("\(item.label)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .lineLimit(1)
                        case .category:
                            Text("\(item.category)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .lineLimit(1)
                        case .xValue:
                            Text("\(item.xValue, specifier: formatString)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .lineLimit(1)
                        case .yValue:
                            Text("\(item.yValue, specifier: formatString)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .lineLimit(1)
                        case .date:
                            Text(item.date ?? .now, style: .date )
                                .frame(minWidth: 150, maxWidth: .infinity, alignment: .leading)
                                .lineLimit(1)
                            
                        }
                    }
                }
            })
        }
    }
    
}

#Preview("Full") {
    KeyValueTable( data: DataPoint.defaultDataPoints,
                   columnTypes: [.grouping, .label, .category, .xValue, .yValue],
                   columnHeaders: ["Grouping Label","Label","Category Label","X Value","Y Value"] )
}

#Preview("Second") {
    KeyValueTable( data: DataPoint.defaultDataPoints,
                   columnTypes: [ .label, .xValue, .grouping,  .yValue],
                   columnHeaders: ["Label","X","Grouping","Y Value"] )
}


#Preview("Third") {
    KeyValueTable( data: DataPoint.defaultDataPoints,
                   columnTypes: [.date, .xValue],
                   columnHeaders: ["Date", "X Value"],
                   formatString: "%0.0f",
                   minColWidth: 200 )
}
