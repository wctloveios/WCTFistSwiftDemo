//
//  LearnSwitchViewController.swift
//  WCTFirstSwiftDemo
//
//  Created by wct on 2020/7/2.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class LearnSwitchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.learnSwitch()
        // Do any additional setup after loading the view.
    }
    
    func learnSwitch() {
        // switch 大小也是固定不变的
        let wctswitch = UISwitch.init()
        wctswitch.frame = CGRect.init(x: 100, y: 200, width: 100, height: 100);
        wctswitch.isOn = true
        // 设置按钮处于关闭状态时边框的颜色
        wctswitch.tintColor = .red;
        // 设置开关处于开启时的状态
        wctswitch.onTintColor = .black;
        // 设置开关的状态钮颜色
        wctswitch.thumbTintColor = .green;
        wctswitch.addTarget(self, action: #selector(valueChange1(_:)), for: .valueChanged)
        self.view.addSubview(wctswitch)
    }
    
    @objc func valueChange1(_ wctswitch:UISwitch) -> Void {
        print(wctswitch.isOn)
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
