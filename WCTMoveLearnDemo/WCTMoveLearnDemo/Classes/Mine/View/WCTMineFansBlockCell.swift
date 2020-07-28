//
//  WCTMineFansBlockCell.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/21.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit
import Kingfisher

class WCTMineFansBlockCell: UICollectionViewCell, RegisterCellOrNib {
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var fansModel: WCTMineFansModel? {
        didSet {
            titleLabel.text = fansModel?.name
            imageV.kf.setImage(with: URL(string: (fansModel?.icon)!))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        theme_backgroundColor = "colors.cellBackgroundColor"
        titleLabel.theme_textColor = "colors.black"
    }

}
