//
//  ButtonUploadPhoto.swift
//  Hydrangea Course Timetable
//
//  Created by Acan on 2023/9/27.
//

import SwiftUI
import Foundation
import UniformTypeIdentifiers

struct ButtonSelectImage: View {
    
    @State private var selectedImage: NSImage?
    
    var body: some View {
        Button("Select Image") {
            let openPanel = NSOpenPanel()
            openPanel.allowedContentTypes = [UTType.image]
            openPanel.canChooseDirectories = false
            
            if openPanel.runModal() == .OK {
                if let imageURL = openPanel.url {
                    selectedImage = NSImage(contentsOf: imageURL)
                    
                    if let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                        let fileURL = documentsDirectoryURL.appendingPathComponent("image.png")
                        if let image = selectedImage, let imageData = image.tiffRepresentation {
                            do {
                                try imageData.write(to: fileURL)
                                print("Image Saved Successfully：\(fileURL.path)")
                            } catch {
                                print("Image Saved Failed：\(error)")
                            }
                        }
                    }
                }
            }
        }
    }
}
