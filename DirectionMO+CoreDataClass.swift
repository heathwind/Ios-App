//
//  DirectionMO+CoreDataClass.swift
//  TranslateApp
//
//  Created by xcode on 19.12.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import Foundation
import CoreData


public class DirectionMO: NSManagedObject {
    class func createOrUpdate(with direction:String, context: NSManagedObjectContext) throws -> DirectionMO{
        let request:NSFetchRequest<DirectionMO> = DirectionMO.fetchRequest()
        request.predicate=NSPredicate(format: "direction=%@", direction)
        
        let newDirection:DirectionMO
        let result=try context.fetch(request)
        if result.count==0{
            newDirection=DirectionMO(context: context)
        } else if let firstDirection=result.first,result.count==1{
            newDirection=firstDirection
        } else {
            assertionFailure("something went wrong")
            newDirection=DirectionMO(context: context)
        }
        newDirection.direction=direction
        return newDirection
    }
}
