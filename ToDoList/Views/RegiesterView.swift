//
//  RegiesterView.swift
//  ToDoList
//
//  Created by Khaled Mohsen on 24/05/2024.
//

import SwiftUI

struct RegiesterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        
        //header
        HeaderView(title: "Register", subtitle: "Start Organizing ToDos", angle: -15, background: .orange)
        
        
        Form{
            
            TextField("Full Name", text: $viewModel.name).textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            
            TextField("Email Address", text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .autocorrectionDisabled()
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            TLButtonview(title: "Create Account", background: .green){
                viewModel.regiester()
                
                        //attempt  registration
                
            }
            .padding()
        }.offset(y:-50)
        
        
        Spacer()
        
        
        
    }
}

#Preview {
    RegiesterView()
}
