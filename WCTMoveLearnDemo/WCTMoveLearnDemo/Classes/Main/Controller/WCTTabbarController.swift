//
//  WCTTabbarController.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/16.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

class WCTTabbarController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print(tabBar.subviews)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置 tabbar 主题色
        let tabbar = UITabBar.appearance()
        tabbar.tintColor = UIColor.init(red: 245/255.0, green: 90/255.0, blue: 93/255.0, alpha: 1);
        
        // 调用创建子控制器
        addChildViewController()
        
        /// 接受通知
        NotificationCenter.default.addObserver(self, selector: #selector(receiveNightChangeTheme), name: NSNotification.Name(rawValue: changeTabThemeColor), object: nil)
    }
    
    @objc func receiveNightChangeTheme(notification: Notification) {
        let selected = notification.object as! Bool
        if selected { // 设置为夜间
            for childController in children {
                switch childController.title! {
                case "首页":
                    setNightChildController(controller: childController, imageName: "home")
                case "视频":
                    setNightChildController(controller: childController, imageName: "video")
                case "小视频":
                    setNightChildController(controller: childController, imageName: "huoshan")
                case "我的":
                    setNightChildController(controller: childController, imageName: "no_login")
                default:
                    break
                }
            }
        } else { // 设置为日间
            for childController in children {
                switch childController.title! {
                case "首页":
                    setDayChildController(controller: childController, imageName: "home")
                case "视频":
                    setDayChildController(controller: childController, imageName: "video")
                case "小视频":
                    setDayChildController(controller: childController, imageName: "huoshan")
                case "我的":
                    setDayChildController(controller: childController, imageName: "no_login")
                default:
                    break
                }
            }
        }
    }
    
    /// 设置夜间控制器: 控制器 + 图片前缀名
    private func setNightChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_night_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_night_32x32_")
    }
    
    /// 设置日间控制器: 控制器 + 图片前缀名
    private func setDayChildController(controller: UIViewController, imageName: String) {
        controller.tabBarItem.image = UIImage(named: imageName + "_tabbar_32x32_")
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_tabbar_press_32x32_")
    }
    
    /// 添加子控制器（指定私有）
    private func addChildViewController() {
        setChildViewController(WCTHomeViewController(), title: "首页", imageName: "home")
        setChildViewController(WCTVideoViewController(), title: "直播", imageName: "video")
        setChildViewController(WCTHuoShanViewController(), title: "火山", imageName: "huoshan")
        setChildViewController(WCTMineViewController(), title: "我的", imageName: "mine")
        
        // tabBar 是 readonly 属性，不能直接修改，利用 KVC 把 readonly 属性的权限改过来
        setValue(WCTTabBar(), forKey: "tabBar")
    }
    
    /// 初始化自控制器
    /// - Parameter childController: childController
    /// - Parameter title: title descriptiontitle
    /// - Parameter imageName: imageName
    /// - Parameter selectImageName: selectImag
    private func setChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        // 设置 tabbar 文字和图片
        if UserDefaults.standard.bool(forKey: isNight) {
            setNightChildController(controller: childController, imageName: imageName)
        } else {
            setDayChildController(controller: childController, imageName: imageName)
        }
        
        // 设置 tabbar 的文字
        childController.tabBarItem.title = title
        childController.title = title
        
        // 添加导航栏为 UITabBarController 的自控制器
        let navi = WCTNaviViewController(rootViewController: childController)
        addChild(navi)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
