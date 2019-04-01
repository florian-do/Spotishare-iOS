//
//  CacheDB.swift
//  Spotishare
//
//  Created by DO Florian on 3/29/19.
//  Copyright © 2019 DO Florian. All rights reserved.
//

import Foundation
import CoreData

class CacheDB {
    private static let instance = CacheDB()
    
    init() {
        
    }

    public static func get() -> CacheDB {
        return instance
    }
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func getNewEntity(context: NSManagedObjectContext, entity: String) -> NSManagedObject {
        let entity = NSEntityDescription.entity(forEntityName: entity, in: context)
        return NSManagedObject(entity: entity!, insertInto: context)
    }
    
    func wipeDb(context: NSManagedObjectContext, entity: String) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                context.delete(data)
            }
            do {
                try context.save()
            } catch {
                return
            }
        } catch {
            return
        }
    }
}
