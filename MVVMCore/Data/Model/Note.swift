//
//  Note.swift
//  MVVMCore
//
//  Created by Felix B on 07.02.24.
//

import Foundation

struct Note {
    var title: String
    var isDone: Bool
    
    init(title: String, isDone: Bool) {
        self.title = title
        self.isDone = isDone
    }
    
    init(_ noteEntity: NoteEntity) {
        self.title = noteEntity.title ?? ""
        self.isDone = noteEntity.isDone
    }
}

let testNote = Note(title: "test Title", isDone: false)
