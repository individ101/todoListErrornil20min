//
//  TodoList+CoreDataProperties.swift
//  TodoListErrorNil20min
//
//  Created by Abubakar Bibulatov on 10.04.2025.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }
    @NSManaged public var creationDate: Date?
    @NSManaged public var descriptionText: String?
    @NSManaged public var title: String?
    @NSManaged public var id: String?

}

extension Note : Identifiable {
    func updateNote(title: String, text: String) {
        self.title = title
        self.descriptionText = text
        self.creationDate = Date()
        
        try? managedObjectContext?.save()
    }
    
    func deleteNote() {
        managedObjectContext?.delete(self)
        try? managedObjectContext?.save()
    }
}
