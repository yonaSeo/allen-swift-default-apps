//
//  CoreDataManager.swift
//  ToDoApp
//
//  Created by yona on 12/20/23.
//

import UIKit
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}
    
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    private lazy var context = appDelegate?.persistentContainer.viewContext
    private let modelName = "ToDoData"
    
    func getToDoList() -> [ToDoData] {
        var toDoDataList: [ToDoData] = []
        
        if let context {
            // let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
            let request = ToDoData.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
            do {
                // if let fetchedData = try context.fetch(request) as? [ToDoData] {}
                toDoDataList = try context.fetch(request)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        return toDoDataList
    }
    
    func setToDoItem(memoText: String?, color: Int64, completion: @escaping () -> Void) {
        guard let context else { completion(); return }
        guard let entity = NSEntityDescription.entity(forEntityName: self.modelName, in: context) else { completion(); return }
        guard let toDoData = NSManagedObject(entity: entity, insertInto: context) as? ToDoData else { completion(); return }
        
        toDoData.memoText = memoText
        toDoData.color = color
        toDoData.date = Date()
        
        dump(toDoData)
            
        if context.hasChanges {
            do { try context.save(); completion()}
            catch { print(error.localizedDescription); completion() }
        }
    }
    
    func deleteToDoItem(deleteItem: ToDoData, completion: @escaping () -> Void) {
        guard let date = deleteItem.date else { completion(); return }
        guard let context else { completion(); return }
        
        // let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
        let request = ToDoData.fetchRequest()
        request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
        
        do {
            // guard let fetchedData = try context.fetch(request) as? [ToDoData] else { completion(); return }
            let fetchedData = try context.fetch(request)
            guard let targetData = fetchedData.first else { completion(); return }
            
            context.delete(targetData)
            
            if context.hasChanges {
                do { try context.save(); completion() }
                catch { print(error.localizedDescription); completion() }
            }
        } catch {
            print(error.localizedDescription)
            completion()
        }
        completion()
    }
    
    func updateToDoItem(updateItem: ToDoData, completion: @escaping () -> Void) {
        guard let date = updateItem.date else { completion(); return }
        guard let context else { completion(); return }
        
        // let request = NSFetchRequest<NSManagedObject>(entityName: self.modelName)
        let request = ToDoData.fetchRequest()
        request.predicate = NSPredicate(format: "date = %@", date as CVarArg)
        
        do {
            // guard let fetchedData = try context.fetch(request) as? [ToDoData] else { completion(); return }
            let fetchedData = try context.fetch(request)
            guard var targetData = fetchedData.first else { completion(); return }
            
            targetData = updateItem
            
            if context.hasChanges {
                do { try context.save(); completion() }
                catch { print(error.localizedDescription); completion() }
            }
        } catch {
            print(error.localizedDescription)
            completion()
        }
        completion()
    }
}
