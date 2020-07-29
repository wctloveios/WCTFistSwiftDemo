//
//  WCTTabBar.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/16.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

class WCTTabBar: UITabBar {

    // 默认初始化：补充
    override init(frame: CGRect) {
        super.init(frame: frame)
        theme_tintColor = "colors.tabbarTintColor"
        theme_barTintColor = "colors.cellBackgroundColor"
        addSubview(publishButton)
    }

    // 懒加载方式创建button:
    // 指定访问权限为 私有属性：
    /* 复习知识点
     private 绝对私有，除了在当前类中可以访问之外，其他任何类或者该类的扩展都不能访问到
     fileprivate 文件私有，可以在当前类文件中范文，其他文件不能访问
     open 在任何文件中都能访问
     internal 默认，也可以不写
     */
    private lazy var publishButton: UIButton = {
        let publishButton = UIButton(type: .custom)
        publishButton.theme_setBackgroundImage("images.publishButtonBackgroundImage", forState: .normal)
        publishButton.theme_setBackgroundImage("images.publishButtonBackgroundSelectedImage", forState: .selected)
        publishButton.sizeToFit()
        return publishButton
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 设置当前 tabBar 的宽度和高度
        let width = frame.width
        let height = frame.height
        
        publishButton.center = CGPoint(x: width * 0.5, y: height * 0.5 - 7)
        
        // 设置其他按钮的 frame
        let buttonW: CGFloat = width * 0.2
        let buttonH: CGFloat = height
        let buttonY: CGFloat = 0
        
        // 遍历设置约束：使用（下标 + 输出值）方式
        var index = 0
        for button in subviews {
            // 判断是否是 UITabBarButton 类
            if !button.isKind(of: NSClassFromString("UITabBarButton")!) {
                continue
            }
            
            let buttonX = buttonW * (index > 1 ? CGFloat(index + 1) : CGFloat(index))
            button.frame = CGRect.init(x: buttonX, y: buttonY, width: buttonW, height: buttonH)
            index += 1
        }
    }
}
