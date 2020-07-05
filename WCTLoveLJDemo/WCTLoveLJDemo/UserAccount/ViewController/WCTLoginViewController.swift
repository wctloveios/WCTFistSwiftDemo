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
        NotificationCenter.default.addObserver(self, selector: #selector(didReceivedLogin), name: NSNotification.Name(rawValue:"WCTDidReceivedLoginNotification"), object: nil)
    }
    
    deinit {
         NotificationCenter.default.removeObserver(self)
     }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NotificationCenter.default.post(name: NSNotification.Name("WCTDidReceivedLoginNotification"), object: self, userInfo: nil)
    }
    
    @objc func didReceivedLogin(nofi : Notification) {
        let loginManager = WCTUserDefaultManager.init()
        loginManager.saveLoginState(true)

        let rootVC = WCTTabbarViewContrller.init()
        UIApplication.shared.keyWindow?.rootViewController = rootVC
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
