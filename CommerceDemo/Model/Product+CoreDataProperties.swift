//
//  Product+CoreDataProperties.swift
//  CommerceDemo
//
//  Created by Jignesh on 29/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var addedDate: Double
    @NSManaged public var categoryId: Int16
    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var ranking: Ranking?

}
