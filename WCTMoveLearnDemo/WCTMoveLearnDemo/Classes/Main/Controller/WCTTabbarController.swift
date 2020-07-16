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
        
        
    }
    
    /// 添加子控制器
    func addChildViewController() {
        setChildViewController(WCTHomeViewController(), title: "首页", imageName: "home_tabbar_32x32_", selectImageName: "home_tabbar_press_32x32_")
        setChildViewController(WCTVideoViewController(), title: "直播", imageName: "video_tabbar_32x32_", selectImageName: "video_tabbar_press_32x32_")
        setChildViewController(WCTHuoShanViewController(), title: "火山", imageName: "huoshan_tabbar_32x32_", selectImageName: "huoshan_tabbar_press_32x32_")
        setChildViewController(WCTMineViewController(), title: "我的", imageName: "mine_tabbar_32x32_", selectImageName: "mine_tabbar_press_32x32_")
        
        // tabBar 是 readonly 属性，不能直接修改，利用 KVC 把 readonly 属性的权限改过来
        setValue(WCTTabBar(), forKey: "tabBar")
    }
    
    /// 初始化自控制器
    /// - Parameter childController: childController
    /// - Parameter title: title descriptiontitle
    /// - Parameter imageName: imageName
    /// - Parameter selectImageName: selectImag
    func setChildViewController(_ childController: UIViewController, title: String, imageName: String, selectImageName: String) {
        // 设置 tabbar 的文字和图片
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: selectImageName)
        childController.tabBarItem.title = title
        childController.title = title
        
        // 添加导航栏为 UITabBarController 的自控制器
        let navi = WCTNaviViewController(rootViewController: childController)
        addChild(navi)
    }
}
