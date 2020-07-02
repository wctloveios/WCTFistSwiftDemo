//
//  LearnButtonViewController.swift
//  WCTFirstSwiftDemo
//
//  Created by wct on 2020/7/2.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class LearnButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        self.learnButton()
    }
    
    
    func learnButton() {
        // 参考链接：https://www.jianshu.com/p/d2e15b541e1d
        // 1、创建一个常规的button
        let button = UIButton(type:.custom)
        self.view.addSubview(button)
        button.frame = CGRect(x:50, y:200, width:200, height:100)
        button.setTitle("FirstBtn", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        //字体
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        //设置圆角
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        //设置边框
        button.layer.borderColor = UIColor.purple.cgColor
        button.layer.borderWidth = 2
        //无参数点击事件
        button.addTarget(self, action: #selector(buttonClick1), for: .touchUpInside)
        
        
        // 2、图片文字按钮
        let button1 = UIButton(frame:CGRect(x:50, y:400, width:300, height:300))
        self.view.addSubview(button1)
        button1.setTitle("图片按钮", for: .normal)
        button1.setImage(UIImage(named:"photo1"), for: .normal)
        button1.setImage(UIImage(named:"photo2"), for: .selected)
        button1.backgroundColor = UIColor.red
        // 设置图片和文字偏移
        button1.imageEdgeInsets = UIEdgeInsets.init(top: 50, left: 50, bottom: 50, right: 50)
        button1.titleEdgeInsets = UIEdgeInsets.init(top: 250, left: -150, bottom: 0, right: 0)
        //带button参数传递
        button1.addTarget(self, action: #selector(buttonClick2(button:)), for: .touchUpInside)
    }
    
    //button 无参数点击事件
    @objc func buttonClick1(){
          print("点击了button")
    }
    
    //button 带参数点击事件
    @objc func buttonClick2(button:UIButton ){
        button.isSelected = !button.isSelected
        if button.isSelected {
            button.setTitle("Selected", for: .normal)
        } else{
            button.setTitle("NoSelected", for: .normal)
        }
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
