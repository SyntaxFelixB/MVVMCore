//
//  PersistentStore.swift
//  MVVMCore
//
//  Created by Felix B on 07.02.24.
//

import Foundation
import CoreData

struct PersistentStore {
    static let shared = PersistentStore()
    
    var context: NSManagedObjectContext { container.viewContext }
    
    private let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "NoteCoreData")
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Error with CoreData: \(error), \(error.userInfo)")
            }
        }
    }
    
    func fetchData() -> [NoteEntity] {
        let request = NoteEntity.fetchRequest()
        
        
        do {
            let data = try context.fetch(request)
            return data
        } catch {
            print("error fetching: \(error)")
            return []
        }
    }
    
    func removeNote(_ note: Note) {
        let request = NoteEntity.fetchRequest()

        let predicate = NSPredicate(format: "title = %@", note.title)
        request.predicate = predicate
        
        do {
            let results = try context.fetch(request)
            for result in results {
                context.delete(result)
            }
            try context.save()
        } catch {
            print("No entity to delete found")
        }
    }
    
    func save(_ note: Note) {
        let request = NoteEntity.fetchRequest()

        let predicate = NSPredicate(format: "title = %@", note.title)
        request.predicate = predicate
        
        do {
            let results = try context.fetch(request)
            if (results.isEmpty) {
                let newNote = NoteEntity(context: context)
                newNote.title = note.title
                newNote.isDone = note.isDone
            } else {
                for result in results {
                    result.isDone = note.isDone
                    result.title = note.title
                }
            }
            try context.save()
        } catch let error as NSError {
            NSLog("Error saving context: \(error), \(error.userInfo)")
        }
    }
}
