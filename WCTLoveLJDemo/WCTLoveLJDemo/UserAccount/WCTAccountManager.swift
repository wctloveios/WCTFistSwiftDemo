//
//  WCTAccountManager.swift
//  WCTLoveLJDemo
//
//  Created by wct on 2020/7/5.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

//extension Notification.Name {
//    static let WCTDidReceivedLogoutNotification = Notification.Name(rawValue: "WCTDidReceivedLogoutNotification")
//}
//extension Notification.Name {
//    static let WCTDidReceivedLoginNotification = Notification.Name(rawValue: "WCTDidReceivedLoginNotification")
//}

class WCTAccountManager: NSObject {
    
    override init() {
        super.init()
    }
    
//    func addLoginStateChangedNotifi() {
//        print("=====注册登录、登出通知=====")
//        NotificationCenter.default.addObserver(self, selector: #selector(didReceivedLogin), name: .WCTDidReceivedLogoutNotification, object: self)
//        NotificationCenter.default.addObserver(self, selector: #selector(didReceivedLogout), name: .WCTDidReceivedLoginNotification, object: self)
//    }
    
    @objc func didReceivedLogin() {
        print("=====收到通知，开始登录！=====")
        let loginManager = WCTUserDefaultManager.init()
        loginManager.saveLoginState(true)
        
        let rootVC = WCTTabbarViewContrller.init()
        UIApplication.shared.keyWindow?.rootViewController = rootVC
    }
    
    @objc func didReceivedLogout() {
        print("=====收到通知，开始登出！=====")
        let loginManager = WCTUserDefaultManager.init()
        loginManager.saveLoginState(false)
        
        let loginVC = WCTLoginViewController.init()
        let userCenterNavi = UINavigationController(rootViewController: loginVC)
        UIApplication.shared.keyWindow?.rootViewController = userCenterNavi
    }
}
