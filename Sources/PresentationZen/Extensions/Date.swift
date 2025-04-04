//
//  File.swift
//  PresentationZen
//
//  Created by Rodney Dyer on 10/10/24.
//

import Foundation

public extension Date {
    
    
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
    
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
    
    
}
