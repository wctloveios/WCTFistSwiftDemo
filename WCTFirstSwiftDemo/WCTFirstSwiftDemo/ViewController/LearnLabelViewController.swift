//
//  LearnLabelViewController.swift
//  WCTFirstSwiftDemo
//
//  Created by wct on 2020/7/2.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class LearnLabelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        self.learnUILabel()
    }
    
    func learnUILabel() {
        // 参考链接：
        // 1、label 基本属性
        let firstLabel = UILabel.init()
        firstLabel.frame = CGRect(x: 10, y: 200, width: 300, height: 50)
        firstLabel.text = "你好，小呼噜！你好，断断....."
        firstLabel.textColor = .black
        firstLabel.backgroundColor = .red
        firstLabel.textAlignment = .center
        firstLabel.font = .systemFont(ofSize: 25)
        firstLabel.numberOfLines = 2;
        firstLabel.lineBreakMode = .byCharWrapping
        self.view.addSubview(firstLabel)
        
        // 2、有阴影效果的label
        let shadowLabel = UILabel.init(frame: CGRect(x: 10, y: 300, width: 300, height: 50))
        shadowLabel.text = "你好，小呼噜！你好，断断....."
        shadowLabel.textColor = .black
        shadowLabel.shadowColor = .blue
        shadowLabel.shadowOffset = CGSize(width: 1.0, height: 2.0)
        view.addSubview(shadowLabel)
        
        // 3、富文本label
        let mutableAttributeLabel = UILabel.init(frame: CGRect(x: 10, y:400, width: 300, height: 50))
        let attriStr = NSMutableAttributedString.init(string: "你好，小呼噜！你好，断断.....")
        attriStr.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 25), range: NSMakeRange(0, 3))
        attriStr.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.blue, range: NSMakeRange(0, 3))
        mutableAttributeLabel.attributedText = attriStr
        view.addSubview(mutableAttributeLabel)
        
        
        // 4、自适应高度的label
        let autoSizeLabel = UILabel.init()
        autoSizeLabel.frame = CGRect(x: 10, y: 500, width: 300, height: 0)
        autoSizeLabel.text = "1你好，小呼噜！你好，断断.....2你好，小呼噜！你好，断断.....3你好，小呼噜！你好，断断.....11你好，小呼噜！你好，断断.....22你好，小呼噜！你好，断断.....33你好，小呼噜！你好，断断....."
        autoSizeLabel.textColor = UIColor.black
        autoSizeLabel.numberOfLines = 0
        autoSizeLabel.lineBreakMode = .byCharWrapping
        autoSizeLabel.sizeToFit()
        view.addSubview(autoSizeLabel)
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
