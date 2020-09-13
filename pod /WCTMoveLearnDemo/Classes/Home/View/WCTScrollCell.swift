//
//  WCTScrollCell.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/9/13.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

class WCTScrollCell: UITableViewCell, RegisterCellOrNib {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
