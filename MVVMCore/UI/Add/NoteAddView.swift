//
//  NoteAddView.swift
//  MVVMCore
//
//  Created by Felix B on 09.02.24.
//

import SwiftUI

struct NoteAddView: View {
    @ObservedObject var viewModel: NoteListViewModel
    @Binding var isPresented: Bool
    @State private var title = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                    .multilineTextAlignment(.trailing)
                    .fixedSize()
                
                Button() {
                    viewModel.saveNote(Note(title: title, isDone: false))
                    isPresented = false
                } label: {
                    Text("Speichern")
                }
                .disabled(title.isEmpty)
            }
            .navigationTitle("Neue Note")
        }
    }
}

#Preview {
    NoteAddView(viewModel: NoteListViewModel(), isPresented: .constant(false))
}
