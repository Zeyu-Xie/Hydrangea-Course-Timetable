//
//  ContentView.swift
//  Hydrangea Course Timetable
//
//  Created by 谢泽钰 on 2023/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentDateTime = Date()
    
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
            }
            .frame(width: 800, alignment: .leading)
            
            VStack(alignment: .center) {
                Image("timetable")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 800.0)
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
