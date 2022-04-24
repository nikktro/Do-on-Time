//
//  TaskModels.swift
//  Do-on-Time
//
//  Created by Георгий Кузнецов on 24.04.2022.
//

import Foundation


struct TaskItem {
    let taskName: String
    let taskStartTime: String
    let tasksActions : [Action]
    
}

struct Action {
    let actionName: String
    let actionDuration: Int
}


var tasksArray: [TaskItem] =
[TaskItem(taskName: "Работа"
         ,taskStartTime: "07:30"
         ,tasksActions: actionsArray
         )
]

var actionsArray: [Action] =
[ Action(actionName: "Завтрак", actionDuration: 30)
  ,Action(actionName: "Поездка", actionDuration: 70)
  ,Action(actionName: "Работа", actionDuration: 480)
  ,Action(actionName: "Обед", actionDuration: 60)
  ,Action(actionName: "Домой", actionDuration: 55)
]
