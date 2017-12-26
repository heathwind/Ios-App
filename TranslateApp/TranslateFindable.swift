//
//  TranslateFind.swift
//  TranslateApp
//
//  Created by xcode on 20.12.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import Foundation
import CoreData
protocol TranslateFindable {
    func find(text:String) throws ->[TextMO]
}

class TextCoreDataFinder:TranslateFindable{
    
    private let container: DataBaseContainable
    private let context:NSManagedObjectContext
    
    init(container: DataBaseContainable, context:NSManagedObjectContext) {
        self.container = container
        self.context=context
    }
    func find(text: String) throws -> [TextMO] {
        let result=try TextMO.find(text: text, context: context)
        return result
    }
}
