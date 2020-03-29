//
//  VariationMapModel.swift
//  CommerceDemo
//
//  Created by Jignesh on 07/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import Foundation
import ObjectMapper

class VariationMapModel: Mappable {
    
    var id: Int16?
    var color: String?
    var sizeOfVariant: Int16?
    var price: Double?
    
    public required init(){
    }
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map) {
        
        id    <- map["id"]
        color     <- map["color"]
        sizeOfVariant     <- map["size"]
        price     <- map["price"]
    }
}
