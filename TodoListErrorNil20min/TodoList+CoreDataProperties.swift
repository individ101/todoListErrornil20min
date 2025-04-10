//
//  TodoList+CoreDataProperties.swift
//  TodoListErrorNil20min
//
//  Created by Abubakar Bibulatov on 10.04.2025.
//
//

import Foundation
import CoreData


extension TodoList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoList> {
        return NSFetchRequest<TodoList>(entityName: "TodoList")
    }

    @NSManaged public var isCompleted: Bool
    @NSManaged public var creationDate: Date?
    @NSManaged public var descriptionText: String?
    @NSManaged public var title: String?
    @NSManaged public var id: String?

}

extension TodoList : Identifiable {

}
