//
//  LearnSeniorUIViewController.swift
//  WCTFirstSwiftDemo
//
//  Created by wct on 2020/6/18.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class LearnSeniorUIViewController: UIViewController {

    var datePicker :UIDatePicker!
    var button :UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
//        learnDatePicker()
        learnSlider()
        learnStepper()
        learnSwitch()
        learnProcessView()
    }
    
    
    func learnDatePicker() {
        self.datePicker = UIDatePicker.init(frame: self.view.frame)
        self.view.addSubview(self.datePicker)
        //将日期选择器区域设置为中文，则选择器日期显示为中文
        datePicker.locale = Locale(identifier: "zh_CN")
        // 添加方式监听
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        // 选择模式
        datePicker.datePickerMode = .date
        // 设置颜色
        datePicker.setValue(UIColor.red, forKey: "textColor")
        
        self.button = UIButton.init(type: .system)
        self.button.frame = CGRect.init(x: 50, y: 50, width: 400, height: 100)
        self.view.addSubview(self.button)
        self.button.addTarget(self, action: #selector(showData1), for: .touchUpInside)
    }
    
    //日期选择器响应方法
    @objc func dateChanged(datePicker : UIDatePicker){
        //更新提醒时间文本框
        let formatter = DateFormatter()
        //日期样式
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        
        self.button.setTitle(formatter.string(from: datePicker.date), for: .normal)
    }
    
    @objc func showData1() -> () {
        // 创建一个日期格式器
        let dformatter = DateFormatter()
        // 为日期格式器设置格式字符串
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        // 使用日期格式器格式化日期、时间
        let datestr = dformatter.string(from: datePicker.date)
        let message =  "您选择的日期和时间是：\(datestr)"
        // 创建一个UIAlertController对象（消息框），并通过该消息框显示用户选择的日期、时间
        let alertController = UIAlertController(title: "当前日期和时间",
                                                message: message,
                                                preferredStyle: .alert)
        let comfirmAction = UIAlertAction(title: "确认", style:.default,  handler:{(alerts:UIAlertAction) -> Void in
            print("yes ,This is a test!")
        })
        alertController.addAction(comfirmAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func showData(datePicker :UIDatePicker) -> () {
        let date = datePicker.date
        // 创建一个日期格式器
        let dformatter = DateFormatter()
        // 为日期格式器设置格式字符串
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        // 使用日期格式器格式化日期、时间
        let datestr = dformatter.string(from: date)
        let message =  "您选择的日期和时间是：\(datestr)"
        // 创建一个UIAlertController对象（消息框），并通过该消息框显示用户选择的日期、时间
        let alertController = UIAlertController(title: "当前日期和时间",
                                                message: message,
                                                preferredStyle: .alert)
        let comfirmAction = UIAlertAction(title: "确认", style:.default,  handler:{(alerts:UIAlertAction) -> Void in
            print("yes ,This is a test!")
        })
        alertController.addAction(comfirmAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func learnSlider() {
        
    }
    
    func learnStepper() {
        
    }
    
    func learnSwitch() {
        
    }
    
    func learnProcessView () {
        
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
