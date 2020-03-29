//
//  Tax+CoreDataProperties.swift
//  CommerceDemo
//
//  Created by Jignesh on 29/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//
//

import Foundation
import CoreData


extension Tax {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tax> {
        return NSFetchRequest<Tax>(entityName: "Tax")
    }

    @NSManaged public var name: String?
    @NSManaged public var tax: Double
    @NSManaged public var product: Product?

}
