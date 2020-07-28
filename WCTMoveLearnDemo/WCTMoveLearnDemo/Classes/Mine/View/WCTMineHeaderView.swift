//
//  WCTMineHeaderView.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/23.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit
import IBAnimatable
import SwiftTheme

class WCTMineHeaderView: UIView, NibLoadable {

    @IBOutlet weak var sina: UIButton!
    @IBOutlet weak var wechat: UIButton!
    @IBOutlet weak var qq: UIButton!
    @IBOutlet weak var phone: UIButton!
    @IBOutlet weak var history: UIButton!
    @IBOutlet weak var night: UIButton!
    @IBOutlet weak var collect: UIButton!
    @IBOutlet weak var bgImageV: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var moreBtn: AnimatableButton!
    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.theme_backgroundColor = "colors.tableViewBackgroundColor"
        
        let effectX = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        effectX.maximumRelativeValue = 20
        effectX.minimumRelativeValue = -20
        stackView.addMotionEffect(effectX)
        
         /// 使用 UserDefaults 取值
        night.isSelected = UserDefaults.standard.bool(forKey: isNight)
        /// 设置主题
        phone.theme_setImage("images.loginMobileButton", forState: .normal)
        wechat.theme_setImage("images.loginWechatButton", forState: .normal)
        qq.theme_setImage("images.loginQQButton", forState: .normal)
        sina.theme_setImage("images.loginSinaButton", forState: .normal)
        collect.theme_setImage("images.mineFavoriteButton", forState: .normal)
        history.theme_setImage("images.mineHistoryButton", forState: .normal)
        night.theme_setImage("images.dayOrNightButton", forState: .normal)
        night.setTitle("夜间", for: .normal)
        night.setTitle("日间", for: .selected)
        moreBtn.theme_backgroundColor = "colors.moreLoginBackgroundColor"
        moreBtn.theme_setTitleColor("colors.moreLoginTextColor", forState: .normal)
        collect.theme_setTitleColor("colors.black", forState: .normal)
        history.theme_setTitleColor("colors.black", forState: .normal)
        night.theme_setTitleColor("colors.black", forState: .normal)
        bottomView.theme_backgroundColor = "colors.cellBackgroundColor"
    }
    
    @IBAction func didClickNightBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        /// 使用 UserDefaults 保存值
        UserDefaults.standard.set(sender.isSelected, forKey: isNight)
        WCTTheme.switchNight(sender.isSelected)
        
        // 发送修改tabba颜色的通知
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: changeTabThemeColor), object: sender.isSelected)
    }
    
}
