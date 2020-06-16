//
//  LearnBaseUIViewController.swift
//  WCTFirstSwiftDemo
//
//  Created by wct on 2020/6/15.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class LearnBaseUIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
//        learnUILabel()
//        learnButton()
//        learnTextField()
        learnTextView()
    }
    
    func learnTextView() {
        // 参考链接：https://www.jianshu.com/p/deb3e9e1f10c
        // 创建UITextView对象
        let textView = UITextView.init(frame: CGRect.init(x: 50, y: 50, width: 300, height: 100))
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
        textView.isSelectable = false
        textView.isSelectable = true

        //是否允许进行编辑
        textView.isEditable = false
        textView.isEditable = true
        
        //返回键的类型
        textView.returnKeyType = .done
        //键盘类型
        textView.keyboardType = .numberPad
        
        //是否可以滚动
        textView.isScrollEnabled = true
        
        //自适应高度
        textView.autoresizingMask = UIView.AutoresizingMask.flexibleHeight

        // 2、设置富文本
        let textView1 = UITextView.init(frame: CGRect.init(x: 50, y: 250, width: 300, height: 100))
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
        textView1.becomeFirstResponder()
        textView1.selectedRange = NSMakeRange(30, 10)

        //获取内容整体高度
        let height:CGFloat = textView.contentSize.height
        print(height)
    }
    
    func learnTextField() {
        // 参考链接：https://www.jianshu.com/p/63bdeca39ddf
        let textField = UITextField(frame: CGRect(x:50, y:50, width:200, height:100))
        self.view.addSubview(textField)
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1
        textField.clearButtonMode = .always
        textField.backgroundColor = .blue
        textField.textColor = .white
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        
        textField.adjustsFontSizeToFitWidth = true      //当文字超出文本框宽度时，自动调整文字大小
        textField.minimumFontSize = 14                  //最小可缩小的字号
        textField.contentVerticalAlignment = .bottom    //垂直向下对齐
        textField.returnKeyType = .done  //表示完成输入
    }
    
    func learnButton() {
        // 参考链接：https://www.jianshu.com/p/d2e15b541e1d
        // 1、创建一个常规的button
        let button = UIButton(type:.custom)
        self.view.addSubview(button)
        button.frame = CGRect(x:50, y:50, width:200, height:100)
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
        let button1 = UIButton(frame:CGRect(x:50, y:300, width:300, height:300))
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
    
    func learnUILabel() {
        // 参考链接：
        // 1、label 基本属性
        let firstLabel = UILabel.init()
        firstLabel.frame = CGRect(x: 10, y: 50, width: 300, height: 50)
        firstLabel.text = "你好，小呼噜！你好，断断....."
        firstLabel.textColor = .black
        firstLabel.backgroundColor = .red
        firstLabel.textAlignment = .center
        firstLabel.font = .systemFont(ofSize: 25)
        firstLabel.numberOfLines = 2;
        firstLabel.lineBreakMode = .byCharWrapping
        self.view.addSubview(firstLabel)
        
        // 2、有阴影效果的label
        let shadowLabel = UILabel.init(frame: CGRect(x: 10, y: 100, width: 300, height: 50))
        shadowLabel.text = "你好，小呼噜！你好，断断....."
        shadowLabel.textColor = .black
        shadowLabel.shadowColor = .blue
        shadowLabel.shadowOffset = CGSize(width: 1.0, height: 2.0)
        view.addSubview(shadowLabel)
        
        // 3、富文本label
        let mutableAttributeLabel = UILabel.init(frame: CGRect(x: 10, y:150, width: 300, height: 50))
        let attriStr = NSMutableAttributedString.init(string: "你好，小呼噜！你好，断断.....")
        attriStr.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 25), range: NSMakeRange(0, 3))
        attriStr.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.blue, range: NSMakeRange(0, 3))
        mutableAttributeLabel.attributedText = attriStr
        view.addSubview(mutableAttributeLabel)
        
        
        // 4、自适应高度的label
        let autoSizeLabel = UILabel.init()
        autoSizeLabel.frame = CGRect(x: 10, y: 200, width: 300, height: 0)
        autoSizeLabel.text = "1你好，小呼噜！你好，断断.....2你好，小呼噜！你好，断断.....3你好，小呼噜！你好，断断.....11你好，小呼噜！你好，断断.....22你好，小呼噜！你好，断断.....33你好，小呼噜！你好，断断....."
        autoSizeLabel.textColor = UIColor.black
        autoSizeLabel.numberOfLines = 0
        autoSizeLabel.lineBreakMode = .byCharWrapping
        autoSizeLabel.sizeToFit()
        view.addSubview(autoSizeLabel)
    }
    

}
