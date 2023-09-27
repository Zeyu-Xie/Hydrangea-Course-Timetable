//
//  ContentView.swift
//  Hydrangea Course Timetable
//
//  Created by Acan on 2023/9/24.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Hydrangea Course Timetable")
                    .font(.largeTitle)
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
            
            CourseList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
