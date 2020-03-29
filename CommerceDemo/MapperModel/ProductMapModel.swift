//
//  ProductMapModel.swift
//  CommerceDemo
//
//  Created by Jignesh on 07/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import Foundation
import ObjectMapper

class ProductMapModel: Mappable {
    
    var id: Int16?
    var name: String?
    var dateAdded: String?
    var variants : [VariationMapModel]?
    var taxDetails : TaxMapModel?
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map) {
        id    <- map["id"]
        name     <- map["name"]
        dateAdded     <- map["date_added"]
        variants     <- map["variants"]
        taxDetails   <- map["tax"]
    }
}
