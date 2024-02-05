//
//  TodoListApp.swift
//  TodoList
//
//  Created by SushantNeupane on 9/7/22.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
