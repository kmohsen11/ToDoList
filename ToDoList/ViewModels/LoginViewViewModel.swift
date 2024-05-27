//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Khaled Mohsen on 24/05/2024.
//

import FirebaseAuth
import Foundation
class LoginViewViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    
    init() {}
    
    
    func login(){
        guard validate() else{
            return
        }
        //try login
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            
            errorMessage = "Please Fill in All Fields"
            return false
        }
        
        
        //email
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please Enter Valid Email"
            return false
        }
        
        
        return true
    }
    
}
