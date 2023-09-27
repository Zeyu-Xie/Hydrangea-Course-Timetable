//
//  courseList.swift
//  Hydrangea Course Timetable
//
//  Created by 谢泽钰 on 2023/9/27.
//

import Foundation

struct course: Codable {
    var name: String
    var learn: String
    var repo: String
    var page: String
}

struct courseList: Codable {
    var data: Array<course>
}
