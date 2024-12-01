//
//  Image.swift
//  PresentationZen
//
//  Created by Rodney Dyer on 10/19/24.
//

import Foundation
import SwiftUI

extension Image {
    
    func centerCropped() -> some View {
            GeometryReader { geo in
                self
                .resizable()
                .scaledToFill()
                .frame(width: geo.size.width, height: geo.size.height)
                .clipped()
                .contentShape(Rectangle())
            }
        }
    
}
