//
//  UtilityHelper.swift
//  CommerceDemo
//
//  Created by Jignesh on 06/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import ObjectMapper
import CoreData

class UtilityHelper {
    
    static func roundLayer(view : UIView, radius : CGFloat){
        
        view.layer.cornerRadius = radius
    }
    
    static func convertStringToDesiredString(dateString: String, currentFormat: String, desiredFormat: String) -> String {
        
        if !dateString.isEmpty && !currentFormat.isEmpty && !desiredFormat.isEmpty{
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = currentFormat //Your date format
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC") //Current time zone
            if let date = dateFormatter.date(from: dateString){
                dateFormatter.dateFormat = desiredFormat
                return dateFormatter.string(from: date)
            }
        }
        return ""
    }
    
    static func setShadow(view: UIView, color : UIColor = UIColor.lightGray, width : CGFloat = 0.0, height : CGFloat = 1.0, radius : CGFloat = 1.0, opacity : Float = 1.0)  {
        
        view.layer.shadowColor = color.cgColor
        view.layer.shadowOffset = CGSize.init(width: width, height: height)
        view.layer.shadowOpacity = opacity
        view.layer.shadowRadius = radius
        view.clipsToBounds = false
        view.layer.masksToBounds = false
    }
}

//API Calls
extension UtilityHelper{
    
    static let managedContext = getAppDelegate().managedObjectContext
    
    static func getAppDelegate() -> AppDelegate{
        return (UIApplication.shared.delegate as! AppDelegate)
    }
    
    
    static func getData(completion: ((Bool)->(Void))?){
        
        if let url = URL(string: URLConstants.SERVER_URL){
            
            _ = ApiManager.sendRequestJsonResponse(url: url, methodType: MethodType.GET, body: nil, headersReq: true) { (resp, error) in
                
                if let response = resp as? [String:Any], error == nil{
                    
                    if let categories = response["categories"] as? [[String:Any]], !categories.isEmpty{
                        
                        let arrCategories : [CategoryMapModel] = Mapper().mapArray(JSONArray: categories)
                        
                        for category in arrCategories{
                            
                            DBHelper.addCategories(category: category)
                            
                            if let products = category.products, !products.isEmpty{
                                
                                for product in products{
                                    DBHelper.addProduct(product: product, categoryId: category.id ?? 0)
                                }
                            }
                        }
                        
                        let arrCatWithSubCat = arrCategories.filter({ (catModel) -> Bool in
                            return (catModel.childCategories?.count ?? 0) > 0
                        })
                        
                        if !arrCatWithSubCat.isEmpty{
                            
                            for category in arrCatWithSubCat{
                                
                                if let childCats = category.childCategories, let parentId = category.id, !childCats.isEmpty{
                                    
                                    for childId in childCats{
                                        
                                        _ = DBHelper.updateCategoryForParentId(id: childId, parentId: parentId)
                                    }
                                }
                            }
                        }
                    }
                }
                
                completion?(true)
            }
        }
    }
}
