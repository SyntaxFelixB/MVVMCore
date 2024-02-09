//
//  NodeListViewModel.swift
//  MVVMCore
//
//  Created by Felix B on 07.02.24.
//

import Foundation

class NoteListViewModel: ObservableObject {
    
    @Published var noteItemViewModels: [NoteItemViewModel] = []
    
    private var repo = RepositoryCore()
    
    init() {
        getNotes()
    }
    
    func getNotes() {
        noteItemViewModels = repo.getData()
    }
    
    func removeNote(_ note: Note) {
        if let index = noteItemViewModels.firstIndex(where: {$0.note.title == note.title}){
            noteItemViewModels.remove(at: index)
        }
        repo.removeNote(note)
    }
    
    func saveNote(_ note: Note) {
        let index = noteItemViewModels.firstIndex(where: {$0.note.title == note.title})
        if(index == nil) {
            noteItemViewModels.append(NoteItemViewModel(note: note))
        }
        repo.saveNote(note)
    }
}
