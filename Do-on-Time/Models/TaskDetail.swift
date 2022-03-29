//
//  TaskDetail.swift
//  Do-on-Time
//
//  Created by Nikolay Trofimov on 24.03.2022.
//

import Foundation

struct TaskDetail {
    let startTime: String // TODO: change to Date
    let endTime: String // TODO: change to Date
    var tasks: [Task]
}

struct Task {
    let action: String
    let time: String // TODO: change to Date
}
