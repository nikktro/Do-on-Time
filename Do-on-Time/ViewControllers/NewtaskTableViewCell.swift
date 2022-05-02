//
//  NewtaskCell.swift
//  Do-on-Time
//
//  Created by Георгий Кузнецов on 30.04.2022.
//

import UIKit

class NewtaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newTaskName: UILabel!
    @IBOutlet weak var newTaskDuration: UILabel!
    @IBOutlet weak var newTaskSwitch: UISwitch!
    
    override func awakeFromNib() {
       // super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func addActionToTask(_ sender: Any) {
        if newTaskSwitch.isOn {
            print("it's on")
            guard let name = newTaskName.text else { return }
            guard let duration = newTaskDuration.text else { return }
            actionsForNewTask += [Action(actionName: name, actionDuration: Int(duration) ?? -1)]
            
            print(actionsForNewTask.count)
        } else {
            print("it's off")
            guard let name = newTaskName.text else { return }
            guard let duration = newTaskDuration.text else { return }
            let action = Action(actionName: name, actionDuration: Int(duration) ?? -10)
            for i in 0...actionsForNewTask.count-1 {
                if actionsForNewTask[i] == action {
                    actionsForNewTask.remove(at: i)
                    return
                }
            }
            print(actionsForNewTask.count)
            
        }
    }
}
