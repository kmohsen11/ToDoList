//
//  TLButtonview.swift
//  ToDoList
//
//  Created by Khaled Mohsen on 25/05/2024.
//

import SwiftUI

struct TLButtonview: View {
    let title:String
    let background: Color
    let action: () -> Void
    var body: some View {
        Button{
            //action
            action()
            
        } label:{
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title).foregroundColor(Color.white).bold()
                
            }
        }
    }
}

#Preview {
    TLButtonview(title: "Value", background: .pink
    ) {
        //action
    }
}
