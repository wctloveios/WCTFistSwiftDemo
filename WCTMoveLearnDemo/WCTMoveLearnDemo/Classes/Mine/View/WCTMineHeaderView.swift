//
//  WCTMineHeaderView.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/23.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit
import IBAnimatable

class WCTMineHeaderView: UIView {

    @IBOutlet weak var sina: UIButton!
    @IBOutlet weak var wechat: UIButton!
    @IBOutlet weak var qq: UIButton!
    @IBOutlet weak var phone: UIButton!
    @IBOutlet weak var history: UIButton!
    @IBOutlet weak var night: UIButton!
    @IBOutlet weak var collect: UIButton!
    @IBOutlet weak var bgImageV: UIImageView!
    class func headerView() -> WCTMineHeaderView {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! WCTMineHeaderView
    }

}
