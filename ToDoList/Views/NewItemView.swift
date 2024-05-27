//
//  NewItemView.swift
//  ToDoList
//
//  Created by Khaled Mohsen on 24/05/2024.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item").bold().font(.system (size:32)).padding()
            
            
            
            Form{
             //title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
            //date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //button
                TLButtonview(title: "Save", background: .pink)
                {
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }
                    else{
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert)
            {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date newer than yesterday."))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding (get: {
        return true
    }, set :{_ in
        
        
    }))

}
