//
//  ContentView.swift
//  Hydrangea Course Timetable
//
//  Created by Acan on 2023/9/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    
    @State private var currentDateTime = Date()
    @State private var selectedImage: NSImage?
    @State private var _documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    @State private var _imageURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("image.png")
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading) {
                Text("Hydrangea Course Timetable")
                    .font(.title)
                
                Text("")
                
                Text("- \(formattedDateTime(currentDateTime))")
                    .onAppear {
                        startUpdatingDateTime()
                    }
                Text("")
                
                Button("Select Image") {
                    let openPanel = NSOpenPanel()
                    openPanel.allowedContentTypes = [UTType.image]
                    openPanel.canChooseDirectories = false
                    
                    if openPanel.runModal() == .OK {
                        if let imageURL = openPanel.url {
                            selectedImage = NSImage(contentsOf: imageURL)
                            
                            // @State private var documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
                            
                            
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
                Text("")
                Divider()
            }
            .frame(width: 800, alignment: .leading)
            
            VStack(alignment: .center) {
                Text("")
                if let image = NSImage(contentsOf: _imageURL) {
                    Image(nsImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 800.0)
                } else {
                    Text("Please upload your course timetable by clicking the \"Select Image\" button.")
                }
            }
            
        }
        .padding()
    }
    
    func formattedDateTime(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: date)
    }
    
    func startUpdatingDateTime() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            currentDateTime = Date()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
