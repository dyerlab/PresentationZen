//
//  Color.swift
//  PresentationZen
//
//  Created by Rodney Dyer on 10/18/24.
//

import Foundation
import SwiftUI

extension Color {
    
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat ) {
        var raw: [CGFloat] = []
        
#if canImport( UIKit )
        raw = UIColor( self ).cgColor.components ?? []
#elseif canImport( AppKit )
        raw = NSColor( self ).cgColor.components ?? []
#endif
        if raw.count == 4 {
            return (raw[0],raw[1],raw[2],raw[3])
        }
        
        return (0,0,0,0)
    }
    
    
    var dlColor: DLColor {
        let components = self.components
        var hsba: (h: CGFloat, s: CGFloat, b: CGFloat, a: CGFloat) = (0, 0, 0, 0)
        
        #if canImport( UIKit )
        let col = UIColor(red: components.red, green: components.green, blue: components.blue, alpha: components.alpha)
        col.getHue(&(hsba.h), saturation: &(hsba.s), brightness: &(hsba.b), alpha: &(hsba.a))
        
        #elseif canImport( AppKit )
        let col = NSColor(red: components.red, green: components.green, blue: components.blue, alpha: components.alpha)
        col.getHue(&(hsba.h), saturation: &(hsba.s), brightness: &(hsba.b), alpha: &(hsba.a))
        #endif
        
        return DLColor(hue: hsba.h, saturation: hsba.s, brightness: hsba.b, alpha: hsba.a)
    }
    
    
#if os(macOS)
    static let background = Color(NSColor.windowBackgroundColor)
    static let secondaryBackground = Color(NSColor.underPageBackgroundColor)
    static let tertiaryBackground = Color(NSColor.controlBackgroundColor)
    static let alternativeBackgroundDark = Color(NSColor.alternatingContentBackgroundColors[1] )
    static let alternativeBackgroundLight = Color(NSColor.alternatingContentBackgroundColors.first! )
#else
    static let background = Color(UIColor.systemBackground)
    static let secondaryBackground = Color(UIColor.secondarySystemBackground)
    static let tertiaryBackground = Color(UIColor.tertiarySystemBackground)
    static let alternativeBackgroundDark = Color(UIColor.secondarySystemBackground)
    static let alternativeBackgroundLight = Color(UIColor.tertiarySystemBackground)
#endif
    
}

