//
//  AlarmAddVC.swift
//  clockAPP
//
//  Created by L on 2021/5/29.
//

import UIKit

class AlarmAddVC: UIViewController {
    private var nameLabel:String = "鬧鐘"
    
    var valueAlarm = Alarm(label: "鬧鐘", selectDay: [])
    var ViewController: AlarmVC!
    
    let titleArray = ["重複","標籤","提示聲","稍後提醒"]
    
    @IBAction func myTimePicker(_ sender: UIDatePicker) {
    }
    
    @IBOutlet weak var titleTableView: UITableView!
    
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func TimePicker(_ sender: UIDatePicker) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTableView.delegate = self
        titleTableView.dataSource = self
        titleTableView.tableFooterView = UIView()
        titleTableView.isScrollEnabled = false
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "返回")
        navigationItem.backBarButtonItem?.tintColor = .orange
        //加入/編輯鬧鐘
//        navigationItem.title = "加入鬧鐘"
        
        
        overrideUserInterfaceStyle = .dark
        
    }
    
}

// MARK: - detailTextLabel

extension AlarmAddVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = titleTableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = titleArray[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        
        switch indexPath.row {
        case 0:
            cell.detailTextLabel?.text = valueAlarm.repeatString

        case 1:
            cell.detailTextLabel?.text = valueAlarm.label
        case 2:
            cell.detailTextLabel?.text = "無"
        case 3:
            cell.accessoryView = UISwitch()
            cell.detailTextLabel?.text = ""

        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "toAlarmRepeatVC", sender: nil)
        case 1:
            performSegue(withIdentifier: "toAlarmAddLabelVC", sender: nil)
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toAlarmRepeatVC"{
            if let repeatTBC = segue.destination as? AlarmRepeatVC{
                repeatTBC.delegate = self
                #warning("repeatTBC")
                repeatTBC.selectedDay = valueAlarm.selectDay
            }
        }else if segue.identifier == "toAlarmAddLabelVC"{
            if let labelVC = segue.destination as? AlarmAddLabelVC{
                labelVC.delegate = self
                labelVC.text = valueAlarm.label
            }
        }
    }
}

// MARK: - AlarmRepeatDelegate
extension AlarmAddVC:AlarmRepeatDelegate {
    func AlarmRepeatDelegate(repeatSet: Set<Days>) {
        valueAlarm.selectDay = repeatSet
        titleTableView.reloadData()
    }
}

// MARK: - AlarmAddLabelDelegate
extension AlarmAddVC:AlarmAddLabelDelegate {
    func alarmAddLabel(labelText: AlarmAddLabelVC, text: String) {
        valueAlarm.label = "\(text)"
        titleTableView.reloadData()
    }
}




    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
