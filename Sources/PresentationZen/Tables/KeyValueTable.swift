//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 2/10/24.
//

import SwiftUI

struct KeyValueTable: View {
    var data: [KeyValueData]
    var keyHeader: String = "Key"
    var valueHeader: String = "Value"
    
    
    var body: some View {
        Table(data) {
            TableColumn( keyHeader,
                         value: \.key)
            TableColumn( valueHeader,
                         value: \.value )
        }
    }
}

#Preview {
    KeyValueTable( data: KeyValueData.defaultKeyValueData,
                   keyHeader: "Key Header",
                   valueHeader: "Value Header" )
    .padding()
}

