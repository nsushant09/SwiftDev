//
//  AddView.swift
//  TodoList
//
//  Created by SushantNeupane on 9/7/22.
//

import SwiftUI

struct AddView: View {
    
    //this acts as activity stack in android 
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText : String = ""
    
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        ScrollView{
            
            VStack{
                TextField("Type something here...", text : $textFieldText)
                    
                    .padding(16)
                    .frame(minHeight: 200,maxHeight:.infinity, alignment: .topLeading)
                    .background(Color(UIColor.secondarySystemBackground))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                
                Button(action:saveButtonPressed, label:{
                    Text("Save".uppercased())
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(height:55)
                        .frame(maxWidth:.infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                .padding()
                
                
                
            }.padding()
            
        }
        .navigationTitle("Add an Item")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed(){
        if(textIsAppropriate()){
            listViewModel.addItem(title: textFieldText)
            //to go back to another screen
            presentationMode.wrappedValue.dismiss()
        }else{
            alertTitle = "Your new todo item must be at least 3 characters long!!!"
            showAlert.toggle()
        }
    }
    
    func textIsAppropriate() -> Bool{
        return textFieldText.count >= 3
    }
    
    func getAlert() -> Alert{
        return Alert(title : Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }.preferredColorScheme(.light).environmentObject(ListViewModel())
    }
}
