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
}
