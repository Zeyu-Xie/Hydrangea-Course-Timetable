//
//  AutoTime.swift
//  Hydrangea Course Timetable
//
//  Created by Acan on 2023/9/27.
//

import SwiftUI
import Foundation

struct TextTime: View {
    @State private var currentDateTime = Date()
    var body: some View {
        VStack {
            Text("- \(formattedDateTime(currentDateTime))")
                .onAppear {
                    startUpdatingDateTime()
                }
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
}
