//
//  CoreDataManager.swift
//  TodoListErrorNil20min
//
//  Created by Abubakar Bibulatov on 10.04.2025.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    var notes: [Note] = []
    
    private init() {
        fetchAllNotes()
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TodoListErrorNil20min")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchAllNotes() {
        let request = Note.fetchRequest()
        if let notes = try? persistentContainer.viewContext.fetch(request) {
            self.notes = notes
        }
    }
    
    func addNewNote(title: String, text: String) {
        let note = Note(context: persistentContainer.viewContext)
        note.id = UUID().uuidString
        note.title = title
        note.descriptionText = text
        note.creationDate = Date()
        
        saveContext()
        fetchAllNotes()
    }
}
