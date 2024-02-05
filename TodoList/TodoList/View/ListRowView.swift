//
//  ListRowView.swift
//  TodoList
//
//  Created by SushantNeupane on 9/7/22.
//

import SwiftUI

struct ListRowView: View {
    
    let item : ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding()
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First item static ", isCompleted: false)
    static var item2 = ItemModel(title: "Second item static", isCompleted:false)
    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }.previewLayout(.sizeThatFits)
    }
}
