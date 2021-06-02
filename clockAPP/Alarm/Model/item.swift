//
//  item.swift
//  ToDo
//
//  Created by L on 2021/5/20.
//

import Foundation

class Item {
    var title : String
    
    var subtitle : String
    var done : Bool = false
    
    init(title:String,subtitle:String){
        self.title = title
        self.subtitle = subtitle
    }
}
