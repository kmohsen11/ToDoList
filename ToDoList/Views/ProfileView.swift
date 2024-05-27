//
//  ProfileView.swift
//  ToDoList
//
//  Created by Khaled Mohsen on 24/05/2024.
//

import SwiftUI
import FirebaseFirestore

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    
                    profile(user: user)
                    
                }else{
                    Text("Loading Profile ....")
                }
                
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user:User) -> some View{
        //image
            
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.blue)
                .frame(width: 125, height:125)
            
            
            // info
            VStack(alignment: .leading){
                HStack{
                    Text("Name: ").bold()
                    Text(user.name)
                    
                }.padding()
                HStack{
                    Text("Email: ").bold()
                    Text(user.email)
                    
                }.padding()
                HStack{
                    Text("Member Since: ").bold()
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    
                }.padding()
            }
            
            
            //sign out
            Button("Log out"){
                
                viewModel.logout()
            }.tint(.red)
                .padding()
        
    }
}

#Preview {
    ProfileView()
}
