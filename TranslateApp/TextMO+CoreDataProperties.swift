//
//  TextMO+CoreDataProperties.swift
//  TranslateApp
//
//  Created by xcode on 19.12.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import Foundation
import CoreData


extension TextMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TextMO> {
        return NSFetchRequest<TextMO>(entityName: "Text");
    }

    @NSManaged public var text: String?
    @NSManaged public var translatedText: String?
    @NSManaged public var direction: DirectionMO?

}
