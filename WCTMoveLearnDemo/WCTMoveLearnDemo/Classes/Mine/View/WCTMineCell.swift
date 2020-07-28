//
//  WCTMineCell.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/21.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

class WCTMineCell: UITableViewCell, RegisterCellOrNib {

    @IBOutlet weak var rightImageV: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        /// 设置主题
        titleLabel.theme_textColor = "colors.black"
        detailLabel.theme_textColor = "colors.cellRightTextColor"
        rightImageV.theme_image = "images.cellRightArrow"
        lineView.theme_backgroundColor = "colors.separatorViewColor"
        theme_backgroundColor = "colors.cellBackgroundColor"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
