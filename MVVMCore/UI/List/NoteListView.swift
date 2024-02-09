//
//  NodeListView.swift
//  MVVMCore
//
//  Created by Felix B on 07.02.24.
//

import SwiftUI

struct NoteListView: View {
    @StateObject var viewModel = NoteListViewModel()
    @State private var showAddNote = false
    
    var body: some View {
        NavigationStack {
            List(viewModel.noteItemViewModels, id: \.title) { vm in
                Button() {
                    vm.toggleIsDone()
                    viewModel.saveNote(vm.note)
                } label: {
                    NoteItemView(viewModel: vm)
                }
                .swipeActions {
                    Button(role: .destructive) {
                        viewModel.removeNote(vm.note)
                    } label: {
                        Label("Löscchen", systemImage: "trash")
                    }
                }
                .foregroundColor(.black)
            }
            .navigationTitle("Notes")
            .toolbar {
                Button(action: {showAddNote.toggle()}) {
                    Image(systemName: "plus.circle.fill")
                }
            }
            .sheet(isPresented: $showAddNote) {
                NoteAddView(viewModel: viewModel, isPresented: $showAddNote)
            }
        }
    }
}

#Preview {
    NoteListView()
}
