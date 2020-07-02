//
//  LearnCollectionViewCell.swift
//  WCTFirstSwiftDemo
//
//  Created by wct on 2020/7/2.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class LearnCollectionViewCell: UICollectionViewCell {
    
    var view = UIView()
    var label = UILabel()
    
    class func initItemWithIdentifier(_collectionview:UICollectionView,Identifier:String , index:IndexPath) -> LearnCollectionViewCell {
        //复用
        let cell:LearnCollectionViewCell = _collectionview.dequeueReusableCell(withReuseIdentifier: Identifier, for: index) as! LearnCollectionViewCell
        //设置背景颜色
        cell.backgroundColor = UIColor.orange
        return cell
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.view = UIView.init(frame: CGRect(x:0,y:0, width:self.frame.size.width, height:self.frame.size.height))
        self.addSubview(view)
        
        self.label = UILabel.init(frame: CGRect(x:10, y: 0, width:200, height:self.frame.size.height))
        self.addSubview(label)
    }
}
