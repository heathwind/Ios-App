//
//  CoreDataManager.swift
//  TranslateApp
//
//  Created by xcode on 12.12.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import Foundation
import CoreData

protocol CoreDataProtocol {
    
    func save(context: NSManagedObjectContext)
        throws
    var persistentContainer: NSPersistentContainer
        { get }
    
}

class CoreDataManager: CoreDataProtocol {
    func save(context: NSManagedObjectContext) throws {
        if context.hasChanges {
            try context.save()
        }
    }

    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores()
        { (storeDescription, error) in
            if let error=error as NSError? {
                assertionFailure("Unresolved error \(error.userInfo)")
            }
        }
        return container
    }()
    
}
