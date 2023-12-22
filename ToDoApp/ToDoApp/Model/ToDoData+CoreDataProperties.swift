//
//  ToDoData+CoreDataProperties.swift
//  ToDoApp
//
//  Created by yona on 12/20/23.
//
//

import Foundation
import CoreData


extension ToDoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoData> {
        return NSFetchRequest<ToDoData>(entityName: "ToDoData")
    }

    @NSManaged public var memoText: String?
    @NSManaged public var date: Date?
    @NSManaged public var color: Int64

    public var dateString: String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date else { return "" }
        return formatter.string(from: date)
    }
}

extension ToDoData : Identifiable {

}
