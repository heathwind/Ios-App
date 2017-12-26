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
    
    init(container: DataBaseContainable) {
        self.container = container
    }
    func find(text: String) throws -> [TextMO] {
        let context=container.saveContext
        let result=try TextMO.find(text: text, context: context)
        return result
    }
}
