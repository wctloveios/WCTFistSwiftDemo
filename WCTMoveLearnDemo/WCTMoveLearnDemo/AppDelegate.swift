//
//  AppDelegate.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/16.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 代码实现rootViewController
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController = WCTTabbarController()
        self.window?.makeKeyAndVisible()
        self.window?.backgroundColor = .white
        return true
    }
    
}

