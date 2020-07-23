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
    
    /// 关注 list
    var myFansArray = [WCTMineFansModel]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    
    /// 单个数据
    var myFan: WCTMineFansModel?
    
    
    /// 我的关注 model
    var myCellModel: WCTMineCellModel? {
        didSet {
            titleLabel?.text = myCellModel?.text
            detailLabel?.text = myCellModel?.gray_text
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.collectionViewLayout = WCTFansFlowLayout()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.wct_registerCell(cell: WCTMineFansBlockCell.self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
}

extension WCTMineFansCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myFansArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.wct_dequeueReusableCell(indexPath: indexPath) as WCTMineFansBlockCell
        cell.fansModel = myFansArray[indexPath.row]
        return cell
    }
}


/// 类中类
class WCTFansFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        // 每个 cell 的大小
        itemSize = CGSize(width: 58, height: 74)
        // 横向间距
        minimumLineSpacing = 0
        // 纵向间距
        minimumInteritemSpacing = 0
        // cell 上下左右的间距
        sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        // 设置水平滚动
        scrollDirection = .horizontal
    }
}
