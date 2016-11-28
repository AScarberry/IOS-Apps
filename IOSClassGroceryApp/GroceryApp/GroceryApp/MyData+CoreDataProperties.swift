//
//  MyData+CoreDataProperties.swift
//  GroceryApp
//
//  Created by Scarberry, Aaron on 11/27/16.
//  Copyright © 2016 Scarberry, Aaron. All rights reserved.
//

import Foundation
import CoreData


extension MyData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyData> {
        return NSFetchRequest<MyData>(entityName: "MyData");
    }

    @NSManaged public var item: String?
    @NSManaged public var quantity: Int16
    @NSManaged public var collection: Collection?


}
