//
//  LoginView.swift
//  ToDoList
//
//  Created by Khaled Mohsen on 24/05/2024.
//

import SwiftUI

struct LoginView: View {
    
    
   @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        
        NavigationView{
            VStack{
                // header
                HeaderView(title: "To Do List" , subtitle: "Get it all Done!", angle: 15, background: .pink)
                
                
                //login form
                
              
                
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage).foregroundColor(Color.red)
                    }
                    TextField("Email Address", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        
                    SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                    
                    
                    TLButtonview(title: "Log in", background: .blue){
                        
                        //attemprt  login
                        viewModel.login()
                    }
                    .padding()
                    
                }.offset(y:-50)
                //create account
                
                VStack{
                    
                    Text("New User?")
                    
                    // show registration
                    NavigationLink("Create an account", destination: RegiesterView())
                    
                }
                .padding(.bottom, 50).bold()
                
                Spacer()
            }
        }
    }
    
}
#Preview {
    LoginView()
}
