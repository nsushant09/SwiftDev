//
//  NoItemsView.swift
//  TodoList
//
//  Created by SushantNeupane on 9/9/22.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate : Bool = false
    let secondaryColor : Color = Color("SecondaryAccent")
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                    .fontWeight(.medium)
                    .frame(maxWidth:400)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                
                NavigationLink(destination: AddView(), label: {
                    Text("Add Something 🤪")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:55)
                        .frame(maxWidth: 400)
                        .background(animate ? Color.accentColor : secondaryColor)
                        .cornerRadius(16)
                }).padding(.horizontal, animate ? 30 : 50)
                    .shadow(color: animate ? Color.accentColor.opacity(0.7) : secondaryColor.opacity(0.7),
                            radius: animate ? 30 : 10,
                            x: 0,
                            y: animate ? 50 : 0)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
                
                    
            }.padding(16)
                .onAppear(perform:addAnimationOnAppear)
        }.frame(maxWidth: .infinity,  maxHeight: .infinity)
    }
    
    func addAnimationOnAppear(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline:.now() + 1.5){
            withAnimation(
                Animation
                    .easeInOut(duration:3)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemsView()
        }
    }
}
