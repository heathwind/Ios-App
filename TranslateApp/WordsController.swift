//
//  WordsController.swift
//  TranslateApp
//
//  Created by xcode on 28.11.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class WordsController: UIViewController,WordsDelegate {
    lazy var model=WordsModel(with: UIApplication.container)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTranslateWords.isUserInteractionEnabled=false;
        model.delegate=self
    }
    
    private func createFRC(){
        
    }
    
    @IBOutlet weak var getTranslateWords: UITextView!
    @IBOutlet weak var setTranslateWords: UITextView!
    
    @IBAction func translateText(_ sender: AnyObject) {
        let text=getTranslateWords.text
        
        model.translateText(text: text!)
    }
    
    @IBAction func test(_ sender: AnyObject) {
    }
    
    @IBAction func addToFavorites(_ sender: AnyObject) {
        if getTranslateWords.text != "" && setTranslateWords.text != "" {
            model.addToFavorites(textTranslate: TextTranslate(text: getTranslateWords.text, translatedText: setTranslateWords.text))
        }
    }
    func hadle(text:String){
        setTranslateWords.text=text
    }
}
