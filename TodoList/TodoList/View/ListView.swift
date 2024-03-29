//
//  ListView.swift
//  TodoList
//
//  Created by SushantNeupane on 9/7/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        
        ZStack{
            if(listViewModel.items.isEmpty){
                NoItemsView()
            }else{
                List{
                    ForEach(listViewModel.items){item in
                        ListRowView(item : item)
                            .onTapGesture {
                                withAnimation(.easeIn(duration:0.5)){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List ")
        .navigationBarItems(
            leading:EditButton(),
            trailing :
                NavigationLink("Add", destination: AddView())
        )
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }.environmentObject(ListViewModel())
    }
}


