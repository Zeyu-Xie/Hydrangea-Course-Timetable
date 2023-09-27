//
//  ContentView.swift
//  Hydrangea Course Timetable
//
//  Created by Acan on 2023/9/24.
//

import SwiftUI
import Foundation
import UniformTypeIdentifiers

struct ContentView: View {
    
    @State private var localCourses : courseList = courseList(data: [])
    @State private var selectedImage: NSImage?
    @State private var selectedConfig: NSData?
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Hydrangea Course Timetable")
                    .font(.title)
                Text("")
                
                Link("- Made by Acan", destination: URL(string: "https://Zeyu-Xie.github.io/Acan")!)
                Text("")
                
                TextTime()
                Text("")
                
                HStack {
                    ButtonSelectImage()
                    ButtonUploadConfig()
                    ButtonFolderPath()
                }
                Text("")
                Divider()
            }
            .frame(width: 1280, alignment: .leading)
            
            ImageTimetable()
            
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
            }.frame(width: 1280, alignment: .leading)
            
            CourseList()
            
        }
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
