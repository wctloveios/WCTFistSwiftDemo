//
//  UICollectionView+Extesnion.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/21.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    /// T： 代表泛型
    
    
    /// 注册 cell 的方法
    /// - Parameter cell: cell
    func wct_registerCell<T: UICollectionViewCell>(cell: T.Type) where T: RegisterCellOrNib {
        if let nib = T.nib {
            register(nib, forCellWithReuseIdentifier: T.identifier)
        } else {
            register(cell, forCellWithReuseIdentifier: T.identifier)
        }
    }
    
    
    /// 从缓存迟取出已经存在的 cell
    /// - Parameter indexPath: indexPath
    func wct_dequeueResuableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T:RegisterCellOrNib {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}
