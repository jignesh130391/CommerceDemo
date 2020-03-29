//
//  ApiManager.swift
//  CommerceDemo
//
//  Created by Jignesh on 28/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

//MARK:- Variables
enum MethodType {
    static let GET = 1
    static let PUT = 2
    static let POST = 3
}

class ApiManager {
    
    init(){
    }
    
    let TAG = "ApiManager"
    var dataRequest : DataRequest! = nil
    
    static func getAPIHeaders() -> HTTPHeaders {
        
        return ["Content-Type": "application/json"]
    }
    
    //MARK:- Web Services
    static func sendRequestJsonResponse(url: URL, methodType : Int, body: [String:Any]?, headersReq: Bool, completionHander:@escaping ((_ response: Any?, _ error:NSError?) -> ())) ->ApiManager {
        
        let apiManager = ApiManager()
        var method : HTTPMethod = HTTPMethod.get
        if methodType == MethodType.PUT{
            method = HTTPMethod.put
        }else if methodType == MethodType.POST{
            method = HTTPMethod.post
        }
        
        Alamofire.request(url, method: method, parameters: body, encoding: URLEncoding.default, headers: headersReq ? getAPIHeaders() : nil).validate().validate(contentType: ["application/json"]).responseJSON { (responseData) in
                
                switch responseData.result {
                    
                case .success(let response):
                    completionHander(response, nil)
                    break
                    
                case .failure(let error as NSError):
                    print("APIManager Error: \(error.localizedDescription)")
                    completionHander(nil, error)
                    break
                    
                default :
                    completionHander(nil, nil)
                    break
                }
        }
        return apiManager
    }
    
}
