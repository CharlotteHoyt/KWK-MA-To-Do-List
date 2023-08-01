//
//  ToDoItem.swift
//  To-Do List
//
//  Created by Charlotte Hoyt on 8/1/23.
//

import Foundation

/* init(title: String, isImportant: Bool = false) {
    self.title = title
    self.isImportant = isImportant
}*/

class ToDoItem {
    var title = ""
    var isImportant = false
    
    init(title: String, isImportant: Bool = false) {
        self.title = title
        self.isImportant = isImportant
    }
}
