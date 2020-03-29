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
    @NSManaged public var variations: NSSet?
    @NSManaged public var tax: Tax?

}

// MARK: Generated accessors for variations
extension Product {

    @objc(addVariationsObject:)
    @NSManaged public func addToVariations(_ value: Variants)

    @objc(removeVariationsObject:)
    @NSManaged public func removeFromVariations(_ value: Variants)

    @objc(addVariations:)
    @NSManaged public func addToVariations(_ values: NSSet)

    @objc(removeVariations:)
    @NSManaged public func removeFromVariations(_ values: NSSet)

}
