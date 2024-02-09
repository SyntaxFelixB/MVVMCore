//
//  RepositoryCore.swift
//  MVVMCore
//
//  Created by Felix B on 09.02.24.
//

import Foundation


class RepositoryCore: RepositoryProtocol {
    let store = PersistentStore.shared
    
    func getData() -> [NoteItemViewModel] {
        let data = store.fetchData().map { entity in
            NoteItemViewModel(note: Note(entity))
        }
        return data
    }
    
    func removeNote(_ note: Note) {
        store.removeNote(note)
    }
    
    func saveNote(_ note: Note) {
        store.save(note)
    }
}
