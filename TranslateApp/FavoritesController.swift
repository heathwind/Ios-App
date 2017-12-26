//
//  FavoritesController.swift
//  TranslateApp
//
//  Created by xcode on 19.12.2017.
//  Copyright © 2017 VSU. All rights reserved.
//
import Foundation
import UIKit

class FavoritesController: UIViewController,UITableViewDataSource,FavoritesDelegate {
    
    var translateItems:[TextMO]=[]
    let model=FavoritesModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return translateItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TranslateCell", for: indexPath)
        if let translateCell=cell as? TranslateCell{
            let textTranslate = translateItems[indexPath.row]
            translateCell.textBefore.text = textTranslate.text
            translateCell.translatedText.text=textTranslate.translatedText
            //translateCell.textBefore.text = "\(indexPath.row)"
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.delegate=self
        model.loadData()
    }
    
    func hadle(translate:[TextMO]){
        translateItems=translate
        tableView.reloadData()
    }
}
