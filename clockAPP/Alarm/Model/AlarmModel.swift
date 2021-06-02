//
//  AlarmModel.swift
//  clockAPP
//
//  Created by L on 2021/5/31.
//

import Foundation

struct Alarm : Codable {
    
//    var date: Date
//    var isOn: Bool
    
    var label: String
    
    var selectDay: Set<Days> = [.monday]
    
    var repeatString: String {
        switch selectDay {
        case []:
            return "永不"
        case [.sunday,.saturday]:
            return "週末"
        case [.monday,.tuesday,.wednesday,.thursday,.friday]:
            return "平日"
        case [.sunday,.monday,.tuesday,.wednesday,.thursday,.friday,.saturday]:
            return "每天"
        default:
//            return "星期"
                    return selectDay
                        .sorted(by: {$0.rawValue < $1.rawValue})
                        .map({$0.dayDetail})
                        .joined(separator: " ")
        }
    }
}

enum Days: Int, CaseIterable,Codable {
    case sunday = 0,monday,tuesday,wednesday,thursday,friday,saturday
    
    var dayString: String {
        switch self {
        case .sunday:
            return "星期日"
        case .monday:
            return "星期一"
        case .tuesday:
            return "星期二"
        case .wednesday:
            return "星期三"
        case .thursday:
            return "星期四"
        case .friday:
            return "星期五"
        case .saturday:
            return "星期六"
        }
    }
    var dayDetail: String {
        switch self {
        case .sunday:
            return "週日"
        case .monday:
            return "週一"
        case .tuesday:
            return "週二"
        case .wednesday:
            return "週三"
        case .thursday:
            return "週四"
        case .friday:
            return "週五"
        case .saturday:
            return "週六"
        }
    }
}
//enum EditMode {
//    case add, edit
//    
//    var title:String{
//        switch self {
//        case .add:
//            return "加入鬧鐘"
//        case .edit:
//            return "編輯鬧鐘"
//        }
//    }
//}
