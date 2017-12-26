//
//  FavoritesModel.swift
//  TranslateApp
//
//  Created by xcode on 20.12.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import Foundation
import CoreData

protocol FavoritesDelegate {
    func hadle(translate:[TextMO])
}


class FavoritesModel {
    
    private let coreDataManager = CoreDataManager()
    
    var delegate:FavoritesController?
    
    var viewContext:NSManagedObjectContext{
        return coreDataManager.persistentContainer.viewContext
    }
    
    func loadData() {
        let request:NSFetchRequest<TextMO>=TextMO.fetchRequest()
        let result=try! viewContext.fetch(request)
        delegate?.hadle(translate: result)
    }
}
