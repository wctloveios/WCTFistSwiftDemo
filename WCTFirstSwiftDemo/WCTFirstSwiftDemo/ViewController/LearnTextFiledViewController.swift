//
//  LearnTextFiledViewController.swift
//  WCTFirstSwiftDemo
//
//  Created by wct on 2020/7/2.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class LearnTextFiledViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        self.learnTextField()
    }
    

    func learnTextField() {
        // 参考链接：https://www.jianshu.com/p/63bdeca39ddf
        let textField = UITextField(frame: CGRect(x:50, y:200, width:200, height:100))
        self.view.addSubview(textField)
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1
        textField.clearButtonMode = .always
        textField.backgroundColor = .blue
        textField.textColor = .white
        textField.textAlignment = .center
//        textField.keyboardType = .numberPad
//        textField.adjustsFontSizeToFitWidth = true      //当文字超出文本框宽度时，自动调整文字大小
//        textField.minimumFontSize = 14                  //最小可缩小的字号
//        textField.contentVerticalAlignment = .bottom    //垂直向下对齐
//        textField.returnKeyType = .done  //表示完成输入
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
