//
//  LearnTextViewViewController.swift
//  WCTFirstSwiftDemo
//
//  Created by wct on 2020/7/2.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class LearnTextViewViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        self.learnTextView()
    }
    
    
    func learnTextView() {
        // 参考链接：https://www.jianshu.com/p/deb3e9e1f10c
        // 创建UITextView对象
        let textView = UITextView.init(frame: CGRect.init(x: 50, y: 200, width: 300, height: 100))
        //添加到视图上
        self.view.addSubview(textView)
        //背景颜色设置
        textView.backgroundColor = .gray
        //设置textview里面的字体颜色
        textView.textColor = .green
        //设置文本字体
        textView.font = UIFont.systemFont(ofSize: 18);//使用系统默认字体，指定14号字号
        textView.font = UIFont(name: "Helvetica-Bold", size: 18)//指定字体，指定字号
        //设置它的背景颜色
        textView.backgroundColor = .gray
        //设置显示内容
        textView.text = "你好，小呼噜！你好，断断....."
        textView.textAlignment = .right
        
        //文本视图设置圆角
        textView.layer.cornerRadius = 20
        textView.layer.masksToBounds = true
        
        //是否允许点击链接和附件
        //        textView.isSelectable = false
        //        textView.isSelectable = true
        
        //是否允许进行编辑
        //        textView.isEditable = false
        //        textView.isEditable = true
        
        //返回键的类型
        //        textView.returnKeyType = .done
        //键盘类型
        //        textView.keyboardType = .numberPad
        //
        //是否可以滚动
        //        textView.isScrollEnabled = true
        //
        //自适应高度
        //        textView.autoresizingMask = UIView.AutoresizingMask.flexibleHeight
        //
        //        //是否可用编辑
        //        textView.isEditable = true
        //        //是否可以被选取
        //        textView.isSelectable = true
        
        // 2、设置富文本
        let textView1 = UITextView.init(frame: CGRect.init(x: 50, y: 350, width: 300, height: 100))
        self.view.addSubview(textView1)
        textView1.backgroundColor = .blue
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "你好，小呼噜！你好，断断.....")
        
        //设置字体颜色
        attributeString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green, range: NSMakeRange(0, attributeString.length))
        
        //文本所有字符字体HelveticaNeue-Bold，16号
        attributeString.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "HelveticaNeue-Bold", size: 16)!, range: NSMakeRange(0, attributeString.length))
        
        //文本0开始5个字符字体HelveticaNeue-Bold，16号
        attributeString.addAttribute(NSAttributedString.Key.font, value: UIFont(name: "HelveticaNeue-Bold", size: 26)!, range: NSMakeRange(0, 5))
        
        //设置字体颜色
        attributeString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: NSMakeRange(0, 3))
        
        //设置文字背景颜色
        attributeString.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.orange, range: NSMakeRange(3, 3))
        
        //赋值富文本
        textView1.attributedText = attributeString
        
        //选中一段文本
        //        textView1.becomeFirstResponder()
        //        textView1.selectedRange = NSMakeRange(30, 10)
        
        //获取内容整体高度
        //        let height:CGFloat = textView.contentSize.height
        //        print(height)
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
