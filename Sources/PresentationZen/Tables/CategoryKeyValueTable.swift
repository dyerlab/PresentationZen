//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 2/10/24.
//

import SwiftUI

struct CategoryKeyValueTable: View {
    
    var data: [CategoryKeyValueData]
    var categoryLabel: String
    var keyLabel: String
    var valueLabel: String
    
    var body: some View {
        Table(data) {
            TableColumn( categoryLabel, value: \.category )
            TableColumn( keyLabel, value: \.key )
            TableColumn( valueLabel, value: \.value )
        }
    }
}

#Preview {
    CategoryKeyValueTable( data: CategoryKeyValueData.defaultCategoryKeyValueData,
                           categoryLabel: "Category",
                           keyLabel: "Key",
                           valueLabel: "Value" )
    .padding()
}
