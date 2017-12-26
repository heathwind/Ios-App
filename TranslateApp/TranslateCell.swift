//
//  TranslateCell.swift
//  TranslateApp
//
//  Created by xcode on 20.12.2017.
//  Copyright © 2017 VSU. All rights reserved.
//

import Foundation
import UIKit

class TranslateCell: UITableViewCell{
    
    @IBOutlet weak var textBefore:UILabel!
    @IBOutlet weak var translatedText:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.awakeFromNib()
    }
}
