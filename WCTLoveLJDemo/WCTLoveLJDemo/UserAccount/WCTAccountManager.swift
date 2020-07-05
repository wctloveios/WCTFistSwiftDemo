//
//  WCTAccountManager.swift
//  WCTLoveLJDemo
//
//  Created by wct on 2020/7/5.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

class WCTAccountManager: NSObject {
    
    override init() {
        super.init()
    }
    
//    func addLoginStateChangedNotifi() {
//        NotificationCenter.default.addObserver(self, selector: #selector(didReceivedLogin), name: NSNotification.Name(rawValue:"WCTDidReceivedLoginNotification"), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(didReceivedLogout), name: NSNotification.Name(rawValue:"WCTDidReceivedLogoutNotification"), object: nil)
//    }
//    
//    @objc func didReceivedLogin(nofi : Notification) {
//        let loginManager = WCTUserDefaultManager.init()
//        loginManager.saveLoginState(true)
//        
//        let rootVC = WCTTabbarViewContrller.init()
//        UIApplication.shared.keyWindow?.rootViewController = rootVC
//    }
//    
//    @objc func didReceivedLogout(nofi : Notification) {
//        let loginManager = WCTUserDefaultManager.init()
//        loginManager.saveLoginState(false)
//        
//        let loginVC = WCTLoginViewController.init()
//        let userCenterNavi = UINavigationController(rootViewController: loginVC)
//        UIApplication.shared.keyWindow?.rootViewController = userCenterNavi
//    }
}
