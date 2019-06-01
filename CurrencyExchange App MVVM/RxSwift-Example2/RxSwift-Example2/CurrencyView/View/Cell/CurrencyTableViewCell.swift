//
//  CurrencyTableViewCell.swift
//  RxSwift-Example2
//
//  Created by JETS Mobile Lab-10 on 5/28/19.
//  Copyright © 2019 Sally Ahmed. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var currencyLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
