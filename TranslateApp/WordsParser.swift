//
//  WordsParser.swift
//  TranslateApp
//
//  Created by xcode on 12.12.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import Foundation

protocol WordsParsable {
    
    func parse(data: Data) throws -> String
}

enum ParsingError:Error{
    case wrongStructure(key: String)
}

class WordsXMLParser:WordsParsable {
    func parse(data: Data) throws -> String {
        let xml = XMLCodable.parse(data)
        guard let translatedWord = xml["Translation"]["text"].element?.text else {
            throw ParsingError.wrongStructure(key: "text")
        }
        return translatedWord
    }

}
