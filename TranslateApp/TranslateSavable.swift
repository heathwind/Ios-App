//
//  TranslateSavable.swift
//  TranslateApp
//
//  Created by xcode on 19.12.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import Foundation
import CoreData
protocol TranslateSavable {
    func save(text:TextTranslate) throws
}

class TextCoreDataSaver:TranslateSavable{
    
    private let container: DataBaseContainable
    private let context:NSManagedObjectContext
    
    init(container: DataBaseContainable, context:NSManagedObjectContext) {
        self.container = container
        self.context=context
    }
    func save(text: TextTranslate) throws {
        try TextMO.createOrUpdate(text: text, context: context)
        try context.save()
    }
}
