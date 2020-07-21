//
//  WCTMineFansCell.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/21.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

class WCTMineFansCell: UITableViewCell, RegisterCellOrNib {
    
    /// 右边箭头
    @IBOutlet weak var rightImageV: UIImageView!
    
    /// 副标题
    @IBOutlet weak var detailLabel: UILabel!
    
    /// 标题
    @IBOutlet weak var titleLabel: UILabel!

    /// 关注
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
