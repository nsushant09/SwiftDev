//
//  itemModel.swift
//  TodoList
//
//  Created by SushantNeupane on 9/9/22.
//

import Foundation

struct ItemModel : Identifiable, Codable{
    var id : String = UUID().uuidString
    var title : String
    var isCompleted : Bool
}

