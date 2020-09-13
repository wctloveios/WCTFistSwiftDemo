//
//  WCTHomeViewController.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/16.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

class WCTHomeViewController: UIViewController {

    // 标题数据表
    fileprivate let newsTitleTable = NewsTitleTable()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        WCTNetworkTool.loadHomeTitleData { (titles) in
            // 向数据库中插入数据
            self.newsTitleTable.insert(titles)
        }
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = WCTScrollViewController()
        vc.hidesBottomBarWhenPushed = false
        self.navigationController?.pushViewController(vc, animated: true);
        
    }
}
