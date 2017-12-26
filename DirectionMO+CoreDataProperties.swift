//
//  DirectionMO+CoreDataProperties.swift
//  TranslateApp
//
//  Created by xcode on 19.12.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import Foundation
import CoreData

extension DirectionMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DirectionMO> {
        return NSFetchRequest<DirectionMO>(entityName: "Direction");
    }

    @NSManaged public var direction: String?
    @NSManaged public var text: NSSet?

}

// MARK: Generated accessors for text
extension DirectionMO {

    @objc(addTextObject:)
    @NSManaged public func addToText(_ value: TextMO)

    @objc(removeTextObject:)
    @NSManaged public func removeFromText(_ value: TextMO)

    @objc(addText:)
    @NSManaged public func addToText(_ values: NSSet)

    @objc(removeText:)
    @NSManaged public func removeFromText(_ values: NSSet)

}
