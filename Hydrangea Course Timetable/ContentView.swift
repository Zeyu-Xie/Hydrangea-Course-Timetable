//
//  ContentView.swift
//  Hydrangea Course Timetable
//
//  Created by 谢泽钰 on 2023/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("test").resizable() // 允许图片自动调整大小
                        .aspectRatio(contentMode: .fit) // 设置图片显示模式
                        .frame(width: 200, height: 200) // 设置图片框架大小
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
