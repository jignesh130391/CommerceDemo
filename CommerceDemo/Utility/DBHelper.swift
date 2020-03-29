//
//  DBHelper.swift
//  CommerceDemo
//
//  Created by Jignesh on 28/03/20.
//  Copyright © 2020 Jignesh. All rights reserved.
//

import Foundation
import CoreData

class DBHelper{
    
    static let managedContext = UtilityHelper.getAppDelegate().managedObjectContext
    
    //MARK:- Category
    static func addCategories(category : CategoryMapModel){
        
        if let idCat = category.id{
            
            let entity = NSEntityDescription.entity(forEntityName: Table.CATEGORY.rawValue, in: managedContext)!
            let catDB = NSManagedObject(entity: entity, insertInto: managedContext) as! Category
            catDB.id = idCat
            catDB.name = category.name
            
            do {
                try managedContext.save()
                
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
        }
    }
    
    static func updateCategoryForParentId(id : Int16, parentId : Int16) -> Bool{
        

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Table.CATEGORY.rawValue)
        
        fetchRequest.fetchLimit = 1;
        fetchRequest.predicate = NSPredicate(format: "id = %d", id)
        
        do {
            let results = try managedContext.fetch(fetchRequest);
            
            if let firstCat = results.first, let category = firstCat as? Category{
                
                category.parentId = parentId
                do {
                    try managedContext.save()
                } catch let error as NSError  {
                    print("Could not save \(error), \(error.userInfo)")
                    return false;
                }
                return true;
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            return false;
        }
        return false;
    }
    
    static func getCategories(parentId : Int16) -> [Category]?{
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Table.CATEGORY.rawValue)
        fetchRequest.predicate = NSPredicate(format: "parentId = %d", parentId)
        
        do {
            let results = try managedContext.fetch(fetchRequest);
            return results as? [Category]
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            return nil
        }
    }
    
    //MARK:- Products
    static func addProduct(product : ProductMapModel, categoryId : Int16, rankDetails : RankingMapModel?){
        
        if let idProduct = product.id{
            
            let entity = NSEntityDescription.entity(forEntityName: Table.PRODUCT.rawValue, in: managedContext)!
            let productDB = NSManagedObject(entity: entity, insertInto: managedContext) as! Product
            productDB.id = idProduct
            productDB.name = product.name
            productDB.addedDate = DateUtility.convertStringToTimeStamp(dateString: product.dateAdded, currentFormat: DateUtility.DATE_FORMAT_T_Z)
            productDB.categoryId = categoryId
            
            if let rankDet = rankDetails{
                
                let entityRank = NSEntityDescription.entity(forEntityName: Table.RANKING.rawValue, in: managedContext)!
                let rank = NSManagedObject(entity: entityRank, insertInto: managedContext) as! Ranking
                
                rank.id = idProduct
                rank.viewCount = rankDet.viewCount ?? 0
                rank.orderedCount = rankDet.orderCount ?? 0
                rank.shredCount = rankDet.shareCount ?? 0
                productDB.ranking = rank
            }
            do {
                try managedContext.save()
                
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
        }
    }
    
    static func getProducts(catId : Int16) -> [Product]?{
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Table.PRODUCT.rawValue)
        fetchRequest.predicate = NSPredicate(format: "categoryId = %d", catId)
        
        do {
            let results = try managedContext.fetch(fetchRequest);
            return results as? [Product]
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            return nil
        }
    }
    
    //MARK:- Ranking
    static func getRatedProducts(type : String) -> [Ranking]?{
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Table.RANKING.rawValue)
        fetchRequest.predicate = NSPredicate(format: "\(type) > 0")
        let sortDesc = NSSortDescriptor(key: type, ascending: false)
        fetchRequest.sortDescriptors = [sortDesc]
        do {
            let results = try managedContext.fetch(fetchRequest);
            return results as? [Ranking]
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            return nil
        }
    }
}
