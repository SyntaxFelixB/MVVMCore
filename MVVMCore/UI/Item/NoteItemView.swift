//
//  NodeItemView.swift
//  MVVMCore
//
//  Created by Felix B on 07.02.24.
//

import SwiftUI

struct NoteItemView: View {
    
    @ObservedObject var viewModel: NoteItemViewModel
    
    var body: some View {
        HStack {
            Text(viewModel.title)
            
            Spacer()
            
            Toggle(isOn: $viewModel.isDone) {}
                .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
        }
    }
}


#Preview {
    NoteItemView(viewModel: NoteItemViewModel(note: testNote))
}
