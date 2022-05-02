//
//  NewTaskVC.swift
//  Do-on-Time
//
//  Created by Георгий Кузнецов on 24.04.2022.
//

import UIKit

class NewTaskVC: UIViewController {
    @IBOutlet weak var newTaskNameFieldText: UITextField!
    @IBOutlet weak var actionsTask: UITableView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionsTask.dataSource = self
    }
    

    @IBAction func addButtonPressed(_ sender: Any) {
        guard let taskName = newTaskNameFieldText.text else { return }
        tasksArray += [TaskItem( taskName: taskName
                               , taskStartTime: "09:00"
                               , tasksActions: actionsForNewTask
                               )
                      ]
        print("task array have counts \(tasksArray.count)     \(tasksArray)")
        actionsForNewTask = []
        dismiss(animated: true)
    }
    
}


extension NewTaskVC: UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actionsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newTaskCell", for: indexPath) as! NewtaskTableViewCell
        
        let action = actionsArray[indexPath.row]
        cell.newTaskDuration.text = String(action.actionDuration)
        cell.newTaskName.text = action.actionName
        cell.newTaskSwitch.isOn = false
    return cell
       
    }
    
}
