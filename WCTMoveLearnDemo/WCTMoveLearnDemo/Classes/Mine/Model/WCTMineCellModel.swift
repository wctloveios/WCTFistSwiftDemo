//
//  WCTMineCellModel.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/18.
//  Copyright © 2020 wct. All rights reserved.
//

import Foundation
import HandyJSON



/// 我的 cell 模型
struct WCTMineCellModel: HandyJSON {
    var gray_text: String = ""
    var text: String = ""
    var url: String = ""
    var key: String = ""
    var tip_new: String = ""
}


/// 我的关注模型
struct WCTMineFansModel: HandyJSON {
    var name: String = ""
    var url: String = ""
    var total_count: Int?
    var description: String = ""
    var time: String = ""
    var type: String = ""
    var icon: String = ""
    var userid: Int?
    var is_verify: Bool?
    var media_id: Int?
    var tips: Bool?
    var id: Int?
    var user_auth_info: String?
    var userAuthInfo: UserAuthInfo? {
        return UserAuthInfo.deserialize(from: user_auth_info)
    }
}

struct UserAuthInfo: HandyJSON {
    var auth_type: Int?
    var auth_info: String?
    
}
