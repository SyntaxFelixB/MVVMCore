//
//  RepositoryProtocol.swift
//  MVVMCore
//
//  Created by Felix B on 09.02.24.
//

import Foundation

protocol RepositoryProtocol {
    func getData() -> [NoteItemViewModel]
    func removeNote(_ note: Note)
    func saveNote(_ note: Note)
}
