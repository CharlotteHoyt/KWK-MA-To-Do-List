//
//  ContentView.swift
//  To-Do List
//
//  Created by Charlotte Hoyt on 8/1/23.
//

import SwiftUI

struct ContentView: View {

    @State var toDoItems: [ToDoItem] = []
    @State private var showNewTask = false
    
    var body: some View {
        VStack {
            HStack {
                Text("To-Do List")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                
                Spacer()
                
                Button(action: {
                    self.showNewTask = true
                    print(showNewTask)
                }) {
                Text ("+")
                }
                .font(.system(size: 30))
                .fontWeight(.black)
            }
            .padding()
            Spacer()
            
        }
        
        List {
           ForEach(toDoItems) { toDoItem in
              /* Text(toDoItem.title) */
                
                if toDoItem.isImportant == true {
                    Text("‼️ " + toDoItem.title)
                } else {
                    Text(toDoItem.title)
                }
            }
        }
        .listStyle(.plain)
        
        if showNewTask {
            NewToDoView(title: "", isImportant: false, toDoItems: $toDoItems, showNewTask: $showNewTask)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }

}
