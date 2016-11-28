//
//  DataManager.swift
//  GroceryApp
//
//  Created by Scarberry, Aaron on 11/27/16.
//  Copyright © 2016 Scarberry, Aaron. All rights reserved.
//

import CoreData

enum DataError: Error {
    case BadManagedObjectContext(String)
    case BadEntity(String)
}

class DataManager {
    static var shared: DataManager = DataManager()
    
    var managedObjectContext: NSManagedObjectContext?
    var data: [MyData]
    var dataCount: Int {
        return data.count
    }
    
    var collections: [Collection]
    var collectionCount: Int {
        return collections.count
    }
    
    var selectedIndex: Int
    var selectedCollectionIndex: Int
    
    private init() {
        data = []
        collections = []
        selectedIndex = -1
        selectedCollectionIndex = -1
        
    }
    
    func createCollection(collectionName name: String?) throws{
        guard let ctx = managedObjectContext else {
            throw DataError.BadManagedObjectContext("The managed object context was nil")
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "MyData", in: ctx) else {
            throw DataError.BadEntity("The entity description was bad")
        }
        let obj = Collection(entity: entity, insertInto: ctx)
        obj.name = name
        
        try? save()
    }
    // MARK: - Get / Create New Data
    
    func create(data: (item: String?, quantity: Int)) throws {
        guard let ctx = managedObjectContext else {
            throw DataError.BadManagedObjectContext("The managed object context was nil")
        }
        guard let entity = NSEntityDescription.entity(forEntityName: "MyData", in: ctx) else {
            throw DataError.BadEntity("The entity description was bad")
        }
        let obj = MyData(entity: entity, insertInto: ctx)
        obj.item = data.item
        obj.quantity = Int16(data.quantity)
        
        try? save()
    }
    
    func getData(from indexPath: IndexPath) -> (item: String?, quantity: Int)? {
        guard let item = data.value(at: indexPath.row) else {
            return nil
        }
        return (item.item, Int(item.quantity))
    }
    
//    func getCollectionData(from indexPath: IndexPath) -> (String?)? {
//        guard let item = collections.value(at: indexPath.row) else {
//            return nil
//        }
//        return (item.name)
//    }

    
    func getSelectedData() -> (item: String?, quantity: Int)? {
        guard let item = data.value(at: selectedIndex) else {
            return nil
        }
        return (item.item, Int(item.quantity))
    }
    
    // MARK: - Fetching Data
    
    func fetch<T: NSManagedObject>() -> [T] {
        var result: [T]? = nil
        managedObjectContext?.performAndWait { [weak self] in
            do {
                result = try self?.executeFetchRequest()
            }
            catch {
                print(error)
            }
        }
        return result ?? []
    }
    
    private func executeFetchRequest<T: NSManagedObject>() throws -> [T]? {
        let request = T.fetchRequest()
        return try request.execute() as? [T]
    }
    
    func save() throws {
        try managedObjectContext?.save()
    }
}
