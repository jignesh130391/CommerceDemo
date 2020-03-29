//
//  ProductMapModel.swift
//  CommerceDemo
//
//  Created by Jignesh on 07/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import Foundation
import ObjectMapper

class RankingMapModel: Mappable {
    
    var id: Int16?
    var viewCount: Int64?
    var shareCount: Int64?
    var orderCount: Int64?
    
    public required init(){
    }
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map) {
        
        id    <- map["id"]
        viewCount     <- map["view_count"]
        orderCount     <- map["order_count"]
        shareCount     <- map["shares"]
    }
}
