//
//  ImageTimetable.swift
//  Hydrangea Course Timetable
//
//  Created by 谢泽钰 on 2023/9/27.
//

import SwiftUI
import Foundation

struct ImageTimetable: View {
    
    @State private var _imageURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("image.png")
    
    var body: some View {
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
        }.frame(width: 1280, alignment: .leading)
    }
}
