//
//  WCTTheme.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/26.
//  Copyright © 2020 wct. All rights reserved.
//

import Foundation
import SwiftTheme

enum WCTTheme: Int {
    case day = 0
    case night = 1
    
    static var before = WCTTheme.day
    static var currrent = WCTTheme.day
    
    /// 选择主题
    static func switchTo(_ theme: WCTTheme) {
        before = currrent
        currrent = theme
        
        switch theme {
        case .day: ThemeManager.setTheme(plistName: "default_theme", path: .mainBundle)
        case .night: ThemeManager.setTheme(plistName: "night_theme", path: .mainBundle)
            
        }
    }
    
    /// 选择了夜间主题
    static func switchNight(_ isToNight: Bool) {
        switchTo(isToNight ? .night : .day)
    }
    
    /// 判断当前是否是夜间主题
    static func isNight() -> Bool {
        return currrent == .night
    }
}
