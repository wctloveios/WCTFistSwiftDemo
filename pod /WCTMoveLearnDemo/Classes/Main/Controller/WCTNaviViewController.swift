//
//  WCTNaviViewController.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/16.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

class WCTNaviViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationBar = UINavigationBar.appearance()
        navigationBar.theme_tintColor = "colors.tabbarTintColor"
        navigationBar.theme_barTintColor = "colors.cellBackgroundColor"
        
        /// 全局拖拽手势
        initGlobalPan()
    }
    
    /// 拦截 push 操作，增加自定义处理
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "lefterbackicon_titlebar_24x24_"), style: .plain, target: self, action: #selector(navigationBack))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    
    /// 默认返回上一控制器
    @objc private func navigationBack() {
        popViewController(animated: true)
    }

}

extension WCTNaviViewController: UIGestureRecognizerDelegate {
    /// 全局拖拽手势
    fileprivate func initGlobalPan() {
        // 创建 pan 手势
        let target = interactivePopGestureRecognizer?.delegate
        let globalPan = UIPanGestureRecognizer(target: target, action: Selector(("handleNavigationTransition:")))
        globalPan.delegate = self
        view.addGestureRecognizer(globalPan)
        // 禁止系统的手势
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count != 1
    }
    
}
