//
//  Ranking+CoreDataProperties.swift
//  CommerceDemo
//
//  Created by Jignesh on 29/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//
//

import Foundation
import CoreData


extension Ranking {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ranking> {
        return NSFetchRequest<Ranking>(entityName: "Ranking")
    }

    @NSManaged public var id: Int16
    @NSManaged public var shredCount: Int64
    @NSManaged public var orderedCount: Int64
    @NSManaged public var viewCount: Int64
    @NSManaged public var product: Product?

}
