//
//  NodeItemViewModel.swift
//  MVVMCore
//
//  Created by Felix B on 07.02.24.
//

import Foundation

class NoteItemViewModel: ObservableObject, Identifiable {
    
    var note: Note
    let title: String
    @Published var isDone: Bool

    init(note: Note) {
        self.note = note
        self.title = note.title
        self.isDone = note.isDone
    }
    
    func toggleIsDone() {
        note.isDone.toggle()
        isDone.toggle()
    }
}
