//
//  Collections+CoreDataProperties.swift
//  GroceryApp
//
//  Created by Scarberry, Aaron on 11/27/16.
//  Copyright © 2016 Scarberry, Aaron. All rights reserved.
//

import Foundation
import CoreData

extension Collections {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Collections> {
        return NSFetchRequest<Collections>(entityName: "Collections");
    }

    @NSManaged public var name: String?
    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension Collections {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: MyData)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: MyData)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}
