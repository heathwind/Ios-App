//
//  WordsModel.swift
//  TranslateApp
//
//  Created by xcode on 28.11.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import Foundation
import CoreData

protocol WordsDelegate: class {
    func hadle(text:String)
}

class WordsModel: NSObject, XMLParserDelegate {
    
    private let session=URLSession(configuration: .default)
    private let parser: WordsParsable = WordsXMLParser()
    private let coreDataManager = CoreDataManager()
    private var saver: TextCoreDataSaver
    private var finder: TextCoreDataFinder
    init(with container: DataBaseContainable) {
        viewContext = container.viewContext
        saver = TextCoreDataSaver(container: container,context: viewContext)
        finder=TextCoreDataFinder(container: container,context: viewContext)
        super.init()
    }
    weak var delegate: WordsController?
    private let key="trnsl.1.1.20171121T073016Z.c4af6addaa469d4c.823d3b604485c4187b25bf30fa3859a4195324fc"
    
    var viewContext:NSManagedObjectContext
    
    func translateText(text:String) {
        do{
            let test=try self.finder.find(text: text)
            if (test.count==1){
                guard let transText = test.first!.translatedText else { return }
                self.delegate?.hadle(text: transText)
            } else if (test.count==0){
                let newString = text.replacingOccurrences(of: " ", with: "%20")
                guard let url=URL(string: "https://translate.yandex.net/api/v1.5/tr/translate?lang=en-ru&key="+key+"&text="+newString) else {return }
                let task=session.dataTask(with: url)
                { (data, responce, error) in
                    if let data = data {
                        do {
                            let item = try self.parser.parse(data: data)
                            DispatchQueue.main.async {
                                self.delegate?.hadle(text: item)
                            }
                        } catch{
                            print(error)
                        }
                    }
                    if let error=error{
                        print(error)
                    }
                }
                task.resume()
            }
        } catch {
            print(error)
        }
    }
    
    func addToFavorites(textTranslate:TextTranslate){
        try! self.saver.save(text: textTranslate)
    }
}
