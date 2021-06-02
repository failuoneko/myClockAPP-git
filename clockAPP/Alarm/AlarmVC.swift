//
//  ViewController.swift
//  ToDo
//
//  Created by L on 2021/5/20.
//

import UIKit

class AlarmVC: UITableViewController {
    
    @IBOutlet var alarmTableView: UITableView!
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
        self.performSegue(withIdentifier: "toAlarmAdd", sender: nil)
    }
    
    var itemArray:[Item] = []
    
    var AlarmIndex:Int!
//    var addMode: EditMode = .add
//    var editMode: EditMode = .edit
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelectionDuringEditing = true
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem?.tintColor = .orange
        tableView.tableFooterView = UIView()
        
        let item1: Item = Item(title: "10:00",subtitle: "鬧鐘")
        let item2: Item = Item(title: "11:00",subtitle: "鬧鐘")
        let item3: Item = Item(title: "12:00",subtitle: "鬧鐘")
        
        itemArray.append(item1)
        itemArray.append(item2)
        itemArray.append(item3)
        
        // 放大navigationBar，滾動時縮小
        navigationController?.navigationBar.prefersLargeTitles = true
        overrideUserInterfaceStyle = .dark
        
    }
    
    // 顯示cell的數量
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }
    
    //MARK: - cell內容
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        //讓ToDoCell裡顯示ItemArray的內容
        cell.textLabel?.text = item.title
        cell.detailTextLabel?.text = item.subtitle
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 40)
        cell.accessoryView = UISwitch()
        cell.editingAccessoryType = .disclosureIndicator
        
        return cell
        
    }
    
    //MARK: - isEditing
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if alarmTableView.isEditing == true {
            AlarmIndex = indexPath.row
            performSegue(withIdentifier: "toAlarmAdd", sender: nil)
        }
    }
    
    //MARK: - Prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAlarmAdd" {
            //取得即將移動之目的地ViewCntroller
//            let vc = segue.destination as! UINavigationController
//            let nextView = vc.topViewController as! AlarmAddVC
            
            
            //設定值
//            nextView.delegate = self
        }
    }
    #warning("刪除功能")
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        itemArray.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
}
//    @IBAction func plusButtonPressed(_ sender: Any) {
//        var textField = UITextField()
//        let alert = UIAlertController(title: "追加", message: "", preferredStyle: .alert)
//        let action = UIAlertAction(title: "新增備忘錄", style: .default) { (action) in
//            //let newItem: Item = Item(title: textField.text!)
//            //self.itemArray.append(newItem)
//            //self.tableView.reloadData()
//            //}
//
//
//            if textField.text == "" {
//                let newItem: Item = Item(title: "未命名")
//                self.itemArray.append(newItem)
//            }else{
//                let newItem: Item = Item(title: textField.text!)
//                self.itemArray.append(newItem)
//            }
//            self.tableView.reloadData()
//        }
//
//        alert.addTextField { (alertTextField) in
//            alertTextField.placeholder = "新增項目"
//            textField = alertTextField
//        }
//
//        alert.addAction(action)
//        present(alert, animated: true, completion: nil)
//
//    }
