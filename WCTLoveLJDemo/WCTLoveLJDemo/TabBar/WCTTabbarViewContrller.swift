//
//  WCTTabbarViewContrller.swift
//  WCTLoveLJDemo
//
//  Created by wct on 2020/7/4.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

class WCTTabbarViewContrller: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.creatRoot()
    }
    
    func creatRoot() {
        let homeVC = WCTHomeViewController.init()
        homeVC.title = "首页"
        let homeNavi = UINavigationController(rootViewController: homeVC)
        
        let wifiVC = WCTWifeViewController.init()
        wifiVC.title = "小仙女"
        let wifiNavi = UINavigationController(rootViewController: wifiVC)
        
        let userCenterVC = WCTUserCenterViewController.init()
        userCenterVC.title = "公子"
        let userCenterNavi = UINavigationController(rootViewController: userCenterVC)
        
        self.viewControllers = [homeNavi, wifiNavi, userCenterNavi]
        self.tabBar.tintColor = UIColor.orange
        
        // 设置标题，未选中状态图标，选中状态图标
        let moreImage1 = UIImage(named: "tabbar_home")?.withRenderingMode(.alwaysOriginal)
        let moreSelectImage1 = UIImage(named:"tabbar_home_sel")?.withRenderingMode(.alwaysOriginal)
        let barItem01 = UITabBarItem(title: "首页", image: moreImage1, selectedImage: moreSelectImage1)
        homeVC.tabBarItem = barItem01
        
        let moreImage2 = UIImage(named: "tabbar_peri")?.withRenderingMode(.alwaysOriginal)
        let moreSelectImage2 = UIImage(named:"tabbar_peri_sel")?.withRenderingMode(.alwaysOriginal)
        let barItem02 = UITabBarItem(title: "小仙女", image: moreImage2, selectedImage: moreSelectImage2)
        wifiNavi.tabBarItem = barItem02
        
        let moreImage3 = UIImage(named: "tabbar_userCenter")?.withRenderingMode(.alwaysOriginal)
        let moreSelectImage3 = UIImage(named:"tabbar_userCenter_sel")?.withRenderingMode(.alwaysOriginal)
        let barItem03 = UITabBarItem(title: "我的", image: moreImage3, selectedImage: moreSelectImage3)
        userCenterNavi.tabBarItem = barItem03
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
