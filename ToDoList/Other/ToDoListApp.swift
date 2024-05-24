//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Khaled Mohsen on 24/05/2024.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
