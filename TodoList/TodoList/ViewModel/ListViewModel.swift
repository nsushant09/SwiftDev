//
//  ListViewModel.swift
//  TodoList
//
//  Created by SushantNeupane on 9/9/22.
//

import Foundation

class ListViewModel : ObservableObject{
    @Published var items : [ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    let itemsKey : String = "items_list"
    
    init(){
        getItems()
    }
    
    func getItems(){
        guard let data = UserDefaults.standard.data(forKey:itemsKey) else {return}
        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from:data) else {return}
        self.items = savedItems
    }
    
    func moveItem(from:IndexSet, to:Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func deleteItem(indexSet : IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func addItem(title : String){
        let newItem = ItemModel(title : title, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item : ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index].isCompleted = !item.isCompleted
        }
    }
    
    func saveItems(){
        //encode into data
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
