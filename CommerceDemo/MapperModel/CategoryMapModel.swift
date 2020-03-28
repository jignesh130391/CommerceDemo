//
//  CategoryMapModel.swift
//  CommerceDemo
//
//  Created by Jignesh on 28/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import Foundation
import ObjectMapper

class CategoryMapModel: Mappable {
    
    var id: Int16?
    var name: String?
    var products: [ProductMapModel]?
    var childCategories: [Int16]?
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map) {
        id    <- map["id"]
        name      <- map["name"]
        products     <- map["products"]
        childCategories        <- map["child_categories"]
    }
}
