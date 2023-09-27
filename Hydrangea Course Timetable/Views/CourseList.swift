//
//  CourseList.swift
//  Hydrangea Course Timetable
//
//  Created by Acan on 2023/9/27.
//

import SwiftUI
import Foundation

struct CourseList: View {
    
    @State private var localCourses: courseList = courseList(data: [])
    @State private var _configURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("config.json")
    
    var body: some View {
        VStack {
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
        }.padding().onAppear {
            getConfig()
        }
    }
    func getConfig() {
        do {
            let configData=try Data(contentsOf: _configURL)
            let decoder=JSONDecoder()
            localCourses=try decoder.decode(courseList.self, from: configData)
        }
        catch {
            print("ERROR")
        }
    }
    init() {
        getConfig()
    }
    
}
