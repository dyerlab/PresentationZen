//
//  MediaPicker.swift
//  Objectives
//
//  Created by Rodney Dyer on 3/5/25.
//

import SwiftUI
import Photos

struct MediaPicker: View {
    @Binding var image: Data?
    
    var body: some View {
        Button("Choose Latest Photo") {
            PHPhotoLibrary.requestAuthorization { status in
                guard status == .authorized || status == .limited else {
                    print("Photo access denied")
                    return
                }
                
                let fetchOptions = PHFetchOptions()
                fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
                let assets = PHAsset.fetchAssets(with: .image, options: fetchOptions)
                
                if let asset = assets.firstObject {
                    let manager = PHImageManager.default()
                    let options = PHImageRequestOptions()
                    options.isSynchronous = true
                    options.deliveryMode = .highQualityFormat
                    
                    manager.requestImageDataAndOrientation(for: asset, options: options) { data, _, _, _ in
                        if let data = data {
                            DispatchQueue.main.async {
                                self.image = data
                            }
                        }
                    }
                }
            }
        }
    }
}



