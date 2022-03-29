//
//  TaskDetailTableViewController.swift
//  Do-on-Time
//
//  Created by Nikolay Trofimov on 25.03.2022.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    var tasklist: TaskDetail! = TaskDetail(startTime: "07:10",
                              endTime: "09:00",
                              tasks: [
                                Task(action: "Energy", time: "00:10"),
                                Task(action: "Shower", time: "00:10"),
                                Task(action: "Breakfast", time: "00:20"),
                                Task(action: "Road", time: "01:20")
                              ]
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return tasklist.tasks.count
        }
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell: UITableViewCell!
        
        if (indexPath.section == 0) {
            cell = tableView.dequeueReusableCell(withIdentifier: "startTime", for: indexPath)
            cell.textLabel?.text = tasklist.startTime
            cell.selectionStyle = .none
            cell.textLabel?.textAlignment = .center
            cell.separatorInset = .zero
        }
        
        if (indexPath.section == 1) {
            cell = tableView.dequeueReusableCell(withIdentifier: "actions", for: indexPath)
            cell.textLabel?.text = tasklist.tasks[indexPath.row].action
            cell.detailTextLabel?.text = tasklist.tasks[indexPath.row].time
        }
        
        if (indexPath.section == 2) {
            cell = tableView.dequeueReusableCell(withIdentifier: "endTime", for: indexPath)
            cell.textLabel?.text = tasklist.endTime
            cell.selectionStyle = .none
            cell.textLabel?.textAlignment = .center
            cell.separatorInset = .zero
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Start at"
        case 1: return "List"
        case 2: return "Be till"
        default: return nil
        }
    }

    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 1 {
            return true
        }
        return false
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if editingStyle == .delete {
                tasklist.tasks.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                // TODO: re-calculate time
            }
        }
    }
    
}
