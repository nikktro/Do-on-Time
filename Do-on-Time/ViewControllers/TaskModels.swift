//
//  TaskModels.swift
//  Do-on-Time
//
//  Created by Георгий Кузнецов on 24.04.2022.
//

import Foundation


struct TaskItem {
    let taskName: String
    var taskStartTime: String
    let tasksActions : [Action]
    
    func getDuration() -> Int {
        var sum = 0
        for i in 0...tasksActions.count - 1 {
            sum += tasksActions[i].actionDuration
        }
        return sum
    }
    
}

struct Action: Equatable {
    let actionName: String
    let actionDuration: Int
}


var currentTasksArray: [TaskItem] =
[TaskItem(taskName: "Работа"
         ,taskStartTime: "07:30"
         ,tasksActions: actionsArray
         )
]

var tasksArray: [TaskItem] = currentTasksArray


var actionsArray: [Action] =
[ Action(actionName: "Завтрак", actionDuration: 30)
 ,Action(actionName: "Поездка", actionDuration: 70)
 ,Action(actionName: "Работа", actionDuration: 480)
 ,Action(actionName: "Обед", actionDuration: 60)
 ,Action(actionName: "Домой", actionDuration: 55)
]


var actionsForNewTask: [Action] = []
