//
//  TaxMapModel.swift
//  CommerceDemo
//
//  Created by Jignesh on 07/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import Foundation
import ObjectMapper

class TaxMapModel: Mappable {
    
    var name: String?
    var tax: Double?
    
    public required init(){
    }
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map) {
        
        name    <- map["name"]
        tax     <- map["value"]
    }
}
