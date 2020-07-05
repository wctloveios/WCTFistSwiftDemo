//
//  WCTHomeViewController.swift
//  WCTLoveLJDemo
//
//  Created by wct on 2020/7/4.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

class WCTHomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(didReceivedLogout), name: NSNotification.Name(rawValue:"WCTDidReceivedLogoutNotification"), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NotificationCenter.default.post(name: NSNotification.Name("WCTDidReceivedLogoutNotification"), object: self, userInfo: nil)
    }
    
    @objc func didReceivedLogout(nofi : Notification) {
        let loginManager = WCTUserDefaultManager.init()
        loginManager.saveLoginState(false)
        
        let loginVC = WCTLoginViewController.init()
        let userCenterNavi = UINavigationController(rootViewController: loginVC)
        UIApplication.shared.keyWindow?.rootViewController = userCenterNavi
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
