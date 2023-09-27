//
//  ButtonFolderPath.swift
//  Hydrangea Course Timetable
//
//  Created by Acan on 2023/9/27.
//

import SwiftUI
import Foundation

struct ButtonFolderPath: View {
    @State private var folderPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    var body: some View {
        Button("Folder Path") {
            let pasteboard = NSPasteboard.general
            pasteboard.clearContents()
            pasteboard.setString(folderPath!.path, forType: .string)
            let alert = NSAlert()
            alert.messageText = "Folder Path Copied"
            alert.informativeText = "Successfully copied folder path to clickboard."
            alert.alertStyle = .informational
            alert.addButton(withTitle: "Close")
            alert.runModal()
        }
    }
}
