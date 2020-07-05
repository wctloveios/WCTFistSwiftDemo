//
//  WCTUserDefaultManager.swift
//  WCTLoveLJDemo
//
//  Created by wct on 2020/7/5.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

class WCTUserDefaultManager: NSObject {

    override init() {
        super.init()
    }
    
    func saveLoginState(_ isLogin: Bool) {
        let userDefault = UserDefaults.standard
        userDefault.set(isLogin, forKey: "isLogin")
        
        if isLogin {
            print("======登录成功！======")
        } else {
            print("=====退出登录！=====")
        }
    }
    
    func getLoginState() -> Bool {
        let userDefault = UserDefaults.standard
        let isLogin = userDefault.bool(forKey: "isLogin")
        return isLogin
    }

}
