//
//  TextMO+CoreDataClass.swift
//  TranslateApp
//
//  Created by xcode on 19.12.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import Foundation
import CoreData


public class TextMO: NSManagedObject {
    
    class func createOrUpdate(text:TextTranslate,context:NSManagedObjectContext) throws ->TextMO
    {
        let request:NSFetchRequest<TextMO>=TextMO.fetchRequest()
        request.predicate=NSPredicate(format: "text=%@", text.text)
        let newText:TextMO
        let result=try context.fetch(request)
        if result.count==0{
            newText=TextMO(context: context)
        } else if let firstText=result.first,result.count==1{
            newText=firstText
        } else {
            assertionFailure("something went wrong")
            newText=TextMO(context: context)
        }
        newText.text=text.text
        newText.translatedText=text.translatedText
        return newText
    }
    
    class func find(text: String,context:NSManagedObjectContext) throws ->[TextMO]{
        let request:NSFetchRequest<TextMO>=TextMO.fetchRequest()
        request.predicate=NSPredicate(format: "text=%@", text)
        let result=try context.fetch(request)
        if(result.count==1){
            print(result.first!.translatedText!)
        }
        return result
    }

}
