//
//  AlarmAddLabelVC.swift
//  clockAPP
//
//  Created by L on 2021/5/20.
//

import UIKit
// MARK: - protocol AlarmAddLabelDelegate
protocol AlarmAddLabelDelegate {
    func alarmAddLabel(labelText:AlarmAddLabelVC,text:String)
}

class AlarmAddLabelVC: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    var delegate:AlarmAddLabelDelegate!
    var text:String!
    
    override func viewDidLoad() {
        navigationItem.title = "標籤"

        super.viewDidLoad()
        // 有內容時顯示刪除
        textField.clearButtonMode = .always
        // returnKey類型
        textField.returnKeyType = .done
        // 追加UITextField
        textField.delegate = self
        //顯示鍵盤
        textField.becomeFirstResponder()

        textField.text = text
        
        overrideUserInterfaceStyle = .dark
    }
    
    //離開滑面
    override func viewDidDisappear(_ animated: Bool) {
        if let text = textField.text {
            if textField.text == "" {
                delegate.alarmAddLabel(labelText: self, text:"鬧鐘")
            }else{
                delegate.alarmAddLabel(labelText: self, text:text)
            }
        }
    }
    
    // 按下reture
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.navigationController?.popViewController(animated: true)
        return true
    }
}
