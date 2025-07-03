//
//  LoadFromAsset.swift
//  BackflowStudio
//
//  Created by Rodney Dyer on 4/18/25.
//

import SwiftUI
import UniformTypeIdentifiers
import ImageIO

@available(macOS 13.0, iOS 16.0, *)

@MainActor
public func LoadFromAsset(named name: String) -> Media? {
    let image = Image(name)
    let renderer = ImageRenderer(content: image)

    guard let cgImage = renderer.cgImage else {
        print("Failed to create CGImage")
        return nil
    }

    let data = NSMutableData()
    guard let destination = CGImageDestinationCreateWithData(data, UTType.png.identifier as CFString, 1, nil) else {
        return nil
    }

    CGImageDestinationAddImage(destination, cgImage, nil)
    guard CGImageDestinationFinalize(destination) else {
        return nil
    }
    
    return Media(imageData: (data as Data) )
}


