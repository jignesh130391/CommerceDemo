//
//  Category+CoreDataProperties.swift
//  CommerceDemo
//
//  Created by Jignesh on 29/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var parentId: Int16

}
