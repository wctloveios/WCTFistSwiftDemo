//
//  AppDelegate.swift
//  WCTLoveLJDemo
//
//  Created by wct on 2020/7/4.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        // 判断启动显示页面
        let loginManager = WCTUserDefaultManager.init()
        let loginState = loginManager.getLoginState()
        if loginState == true {
            let rootVC = WCTTabbarViewContrller.init()
            self.window?.rootViewController = rootVC
        } else {
            let loginVC = WCTLoginViewController.init()
            let userCenterNavi = UINavigationController(rootViewController: loginVC)
            self.window?.rootViewController = userCenterNavi
        }
        self.window?.makeKeyAndVisible()
        
        // 注册登录登出通知
//        let accountManager = WCTAccountManager.init()
//        accountManager.addLoginStateChangedNotifi()
//        
        return true
    }
}

