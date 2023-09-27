//
//  ButtonUploadConfig.swift
//  Hydrangea Course Timetable
//
//  Created by Acan on 2023/9/27.
//

import SwiftUI
import Foundation
import UniformTypeIdentifiers

struct ButtonUploadConfig: View {
    
    @State private var selectedConfig: NSData?
    
    var body: some View {
        Button("Upload Config") {
            let openPanel = NSOpenPanel()
            openPanel.allowedContentTypes = [UTType.json]
            openPanel.canChooseDirectories = false
            
            if openPanel.runModal() == .OK {
                
                if let configURL = openPanel.url {
                    selectedConfig=NSData(contentsOf: configURL)
                }
                if let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                    let fileURL = documentsDirectoryURL.appendingPathComponent("config.json")
                    if let config = selectedConfig {
                        do {
                            try config.write(to: fileURL)
                            print("Config Uploaded Successfully：\(fileURL.path)")
                        } catch {
                            print("Config Uploaded Failed：\(error)")
                        }
                    }
                }
            }
        }
    }
}
