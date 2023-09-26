//
//  ContentView.swift
//  Hydrangea Course Timetable
//
//  Created by Acan on 2023/9/24.
//

import SwiftUI
import Foundation
import UniformTypeIdentifiers

struct course: Codable {
    var name: String
    var learn: String
    var repo: String
    var page: String
}

struct courses: Codable {
    var data: Array<course>
}

struct ContentView: View {
    
    @State private var localCourses : courses = courses(data: [])
    @State private var currentDateTime = Date()
    @State private var selectedImage: NSImage?
    @State private var selectedConfig: NSData?
    @State private var _documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    @State private var _imageURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("image.png")
    @State private var _configURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("config.json")
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading) {
                Text("Hydrangea Course Timetable")
                    .font(.title)
                
                Text("")
                
                Link("- Made by Acan", destination: URL(string: "https://Zeyu-Xie.github.io/Acan")!)
                
                Text("")
                
                Text("- \(formattedDateTime(currentDateTime))")
                    .onAppear {
                        startUpdatingDateTime()
                    }
                Text("")
                HStack {
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
                    
                    Button("Folder Path") {
                        let pasteboard = NSPasteboard.general
                        pasteboard.clearContents()
                        pasteboard.setString(_documentsURL!.path, forType: .string)
                        let alert = NSAlert()
                        alert.messageText = "Folder Path Copied"
                        alert.informativeText = "Successfully copied folder path to clickboard."
                        alert.alertStyle = .informational
                        alert.addButton(withTitle: "Close")
                        alert.runModal()
                    }
                }
                Text("")
                Divider()
            }
            .frame(width: 1280, alignment: .leading).onAppear {
                print("Location: \(_documentsURL?.path)")
            }
            
            VStack(alignment: .center) {
                Text("")
                if let image = NSImage(contentsOf: _imageURL) {
                    Image(nsImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 1280)
                } else {
                    Text("Please upload your course timetable by clicking the \"Select Image\" button.")
                }
                Text("")
                Divider()
            }.frame(width: 1280, alignment: .leading).onAppear {
                print("Location: \(_documentsURL?.path)")
            }
            
            HStack {
                ForEach(0..<localCourses.data.count, id:\.self) {num in
                    VStack(alignment: .leading) {
                        Link(localCourses.data[num].name, destination: URL(string: String(localCourses.data[num].learn))!)
                        HStack {
                            Link("GitHub", destination: URL(string: String(localCourses.data[num].repo))!)
                            Link("Notes", destination: URL(string: String(localCourses.data[num].page))!)
                        }
                    }
                    Spacer()
                }
            }.frame(width: 1280, alignment: .leading).onAppear {
                print("Location: \(_documentsURL?.path)")
            }.padding()
            
        }
        .padding().onAppear {
            getConfig()
        }
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
    
    func getConfig() {
        do {
            let configData=try Data(contentsOf: _configURL)
            let decoder=JSONDecoder()
            localCourses=try decoder.decode(courses.self, from: configData)
        }
        catch {
            print("ERROR")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
