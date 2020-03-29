//
//  Variants+CoreDataProperties.swift
//  CommerceDemo
//
//  Created by Jignesh on 29/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//
//

import Foundation
import CoreData


extension Variants {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Variants> {
        return NSFetchRequest<Variants>(entityName: "Variants")
    }

    @NSManaged public var color: String?
    @NSManaged public var id: Int16
    @NSManaged public var price: Double
    @NSManaged public var size: Int16
    @NSManaged public var product: Product?

}
