//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Khaled Mohsen on 24/05/2024.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    
    @FirestoreQuery var items: [ToDoListItem]
   
   
    init(userId: String){
        
        
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    var body: some View {
        
        
        NavigationView{
            VStack{
                List(items){ item in
                  ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }.tint(.red)
                        }
                    
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do list")
            .toolbar{
                Button{
                    //action
                    
                viewModel.showingNewItemView = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "zVOzoUcN7Pe3wh9sROLgSJw5uAO2")
}
