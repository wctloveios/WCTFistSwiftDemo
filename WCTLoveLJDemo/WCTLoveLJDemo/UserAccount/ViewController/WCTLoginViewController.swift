//
//  WCTLoginViewController.swift
//  WCTLoveLJDemo
//
//  Created by wct on 2020/7/4.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

class WCTLoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录"
        // Do any additional setup after loading the view.
    }
    
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // style 1
//        NotificationCenter.default.post(name: .WCTDidReceivedLoginNotification, object: self, userInfo: nil)
        
        // style 2
        let wct = WCTAccountManager.init()
        wct.didReceivedLogin()
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
