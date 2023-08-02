//
//  ContentView.swift
//  To-Do List
//
//  Created by Charlotte Hoyt on 8/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context

  /*  @State var toDoItems: [ToDoItem] = [] */
    @FetchRequest(
            entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
        
    var toDoItems: FetchedResults<ToDo>
    
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
                    Text("‼️ " + (toDoItem.title ?? "No title"))
                } else {
                    Text(toDoItem.title ?? "No title")
                }
            }
           .onDelete(perform: deleteTask)
        }
        .listStyle(.plain)
        
        if showNewTask {
            NewToDoView(title: "", isImportant: false, /*toDoItems: $toDoItems,*/ showNewTask: $showNewTask)
        }
        
    }
    
    private func deleteTask(offsets: IndexSet) {
        withAnimation {
            offsets.map {toDoItems[$0]} .forEach(context.delete)
            
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }

}
