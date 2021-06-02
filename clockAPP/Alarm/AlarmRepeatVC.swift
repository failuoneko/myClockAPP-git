//
//  WeekTableViewController.swift
//  clockAPP
//
//  Created by L on 2021/5/18.
//

import UIKit
// MARK: - protocol AlarmRepeatDelegate
protocol AlarmRepeatDelegate {
    func AlarmRepeatDelegate(repeatSet:Set<Days>)
}

class AlarmRepeatVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var repeatTableView: UITableView!
    
    var delegate: AlarmRepeatDelegate!
    var selectedDay: Set<Days> = [.friday]
    var allDays: [Days] = Days.allCases
    
    //alarmModel
//    var alarmModel: AlarmModel!
    
    //創建一個空的array，存儲選中單元格的索引。
    var selectedIndexs: [Int] = []
    let items:[String] = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "重複"

        repeatTableView.isScrollEnabled = false
        repeatTableView.tableFooterView = UIView()
        repeatTableView.backgroundColor = UIColor.black
        overrideUserInterfaceStyle = .dark
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate.AlarmRepeatDelegate(repeatSet: selectedDay)
        
    }

    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row]
        
        //判斷是否選中（選中打勾）
        if selectedIndexs.contains(indexPath.row) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }

    // MARK: - UITableViewDelegate 方法，處理列表中的選擇事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let day = allDays[indexPath.row]
        let isSelectedDay = selectedDay.contains(day)
        if isSelectedDay {
            selectedDay.remove(day)
        } else {
            selectedDay.insert(day)
        }
        
        //判斷是否已選擇
        if let index = selectedIndexs.firstIndex(of: indexPath.row){
            selectedIndexs.remove(at: index) //已選擇則取消選擇
        }else{
            selectedIndexs.append(indexPath.row) //未選擇變為已選擇
        }
         
        //刷新該行
//        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.reloadData()
    }
}
