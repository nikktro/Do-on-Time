//
//  AddTaskVC.swift
//  Do-on-Time
//
//  Created by Георгий Кузнецов on 24.04.2022.
//

import UIKit

class AddTaskVC: UIViewController {
    var choosenTime = ""
    var selectedTask = TaskItem(taskName: "", taskStartTime: "", tasksActions: [])
    @IBOutlet weak var startTimePicker: UIDatePicker!
    @IBOutlet weak var tasksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("this is tasksArray \(tasksArray)")
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue){ tasksTableView.reloadData() }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("HH:mm")
        print(formatter.string(from: startTimePicker.date))
        choosenTime = formatter.string(from: startTimePicker.date)
        selectedTask.taskStartTime = choosenTime
        currentTasksArray += [selectedTask]
        
    }
    

    
    
}


extension AddTaskVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        
        cell.textLabel?.text = tasksArray[indexPath.row].taskName
        cell.detailTextLabel?.text = String(tasksArray[indexPath.row].getDuration()) + " мин"
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         selectedTask.taskStartTime = choosenTime
         selectedTask = tasksArray[indexPath.row]
         //tableView.deselectRow(at: indexPath, animated: true)
    }
}
