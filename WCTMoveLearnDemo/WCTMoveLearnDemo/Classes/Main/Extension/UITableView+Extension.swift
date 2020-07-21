//
//  UITableView+Extension.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/21.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

extension UITableView {
    
    /// T： 代表泛型
    
    
    /// 注册 cell 的方法
    /// - Parameter cell: cell
    func wct_registerCell<T: UITableViewCell>(cell: T.Type) where T: RegisterCellOrNib {
        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.identifier)
        } else {
            register(cell, forCellReuseIdentifier: T.identifier)
        }
    }
    
    
    /// 从缓存迟取出已经存在的 cell
    /// - Parameter indexPath: indexPath
    func wct_dequeueResuableCell<T: UITableViewCell>(indexPath: IndexPath) -> T where T:RegisterCellOrNib {
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}
