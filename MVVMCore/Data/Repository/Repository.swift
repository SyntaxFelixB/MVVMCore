//
//  Repository.swift
//  MVVMCore
//
//  Created by Felix B on 07.02.24.
//

import Foundation

class Repository: RepositoryProtocol {
    func getData() -> [NoteItemViewModel] {
        return [
            NoteItemViewModel(note: testNote)
        ]
    }
    
    func removeNote(_ note: Note) {
        
    }
    
    func saveNote(_ note: Note) {
        
    }
}
