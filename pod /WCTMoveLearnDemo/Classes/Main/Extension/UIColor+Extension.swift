//
//  UIColor+Extension.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/16.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

extension UIColor {
    
    // 默认初始化方式 -> 遍历初始化方法(convenience) :需要制定遍历方法
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        // self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
        self.init(displayP3Red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    
    
    /// 增加类方法：一个全局的返回背景颜色的方法
    class func globalBackgroupColor() -> UIColor {
        return UIColor(r: 247, g: 248, b: 249)
    }
    
    /// 背景红色
    class func globalRedColor() -> UIColor {
        return UIColor(r: 230, g: 100, b: 95)
    }
    
    /// 背景灰色 132
    class func grayColor132() -> UIColor {
        return UIColor(r: 132, g: 132, b: 132)
    }
    
    /// 背景灰色 232
    class func grayColor232() -> UIColor {
        return UIColor(r: 232, g: 232, b: 232)
    }
}
