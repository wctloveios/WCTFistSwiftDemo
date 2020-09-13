//
//  WCTConst.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/16.
//  Copyright © 2020 wct. All rights reserved.
//


// 将 Foundation 改成 UIKit（UIKit 包括 Foundation）
import UIKit


/// 屏幕的宽度
let screenWidth = UIScreen.main.bounds.width

/// 屏幕的高度
let screenHeight = UIScreen.main.bounds.height

/// 默认的展示icon
let device_icon_url: String = "https://gtest.aliplus.com/27A429B9B0D949CB8FBA287247E6D8C8/test/a123h0RvLajvfbgm/boneMobile/1.0.140/4f42acbaf776462b61bfbe44b98cfc33/source/assets/app/assets/scene/time.png"

/// 夜间模式 key
let isNight = "isNight"

/// notifi
let changeTabThemeColor = "dayOrNightButtonClicked"

/// 是否是iPhone X
let isIPhoneX: Bool = UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? false : true

/// 自定义菜单
let MyPresentationControllerDismiss = "MyPresentationControllerDismiss"
/// 导航栏点击关注
let NavigationBarConcernButtonClicked = "NavigationBarConcernButtonClicked"
let UserDetailHeaderViewButtonClicked = "UserDetailHeaderViewButtonClicked"

/// tab 宽度
let topTabButtonWidth: CGFloat = screenWidth * 0.2

/// 关注的用户详情界面 topTab 的指示条的宽度 和 高度
let topTabindicatorWidth: CGFloat = 40
let topTabindicatorHeight: CGFloat = 2

let kMyHeaderViewHeight: CGFloat = 280
let kUserDetailHeaderBGImageViewHeight: CGFloat = 146
