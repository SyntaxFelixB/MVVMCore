//
//  CheckBoxToggleStyle.swift
//  MVVMCore
//
//  Created by Felix B on 07.02.24.
//

import SwiftUI

struct CheckBoxToggleStyle: ToggleStyle {
    var isDone: Note
    
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            isDone.isDone.toggle()
        }, label: {
            HStack {
                Image(systemName: isDone.isDone ? "checkmark.square" : "square")
            }
        })
        .foregroundColor(.black)
    }
}
