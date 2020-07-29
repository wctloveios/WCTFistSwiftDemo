//
//  WCTSettingModel.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/29.
//  Copyright © 2020 wct. All rights reserved.
//

import Foundation
import HandyJSON

struct WCTSettingModel: HandyJSON {
    
    var title: String = ""
    var subtitle: String = ""
    var rightTitle: String = ""
    var isHiddenSubtitle: Bool = false
    var isHiddenRightTitle: Bool = false
    var isHiddenSwitch: Bool = false
    var isHiddenRightArraw: Bool = false
}
