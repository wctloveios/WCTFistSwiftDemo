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
    var label :UILabel!
    var slider :UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
//        learnDatePicker()
//        learnSlider()
//        learnStepper()
//        learnSwitch()
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
        self.slider = UISlider.init()
        self.slider.frame = CGRect.init(x: 50, y: 50, width: 300, height: 20)
        self.slider.center = self.view.center
        self.slider.minimumValue = 0 //最小值
        self.slider.maximumValue = 1 //最大值
        self.slider.value = 0.5 //当前默认值
        self.view.addSubview(self.slider)
        
        // 滑块左右两边槽的颜色（颜色方式）
        slider.minimumTrackTintColor = .red //左边槽的颜色
        slider.maximumTrackTintColor = .green //右边槽的颜色
        // 滑块左右两边槽的颜色（图片方式）
//        slider.setMaximumTrackImage(UIImage(named:"同意协议"),for: .normal)
//        slider.setMinimumTrackImage(UIImage(named:"s设备选择"),for: .normal)
        
        // 滑块后面槽线两侧添加图标
//        slider.minimumValueImage = UIImage(named:"同意协议") //左边图标
//        slider.maximumValueImage = UIImage(named:"设备选择") //右边图标
        // 自定义滑块组件图片

        //设置滑块的图片
//        slider.setThumbImage(UIImage(named:"验证码"),for: .normal)

        //设置滑块右边部分的图片-使用三宫格缩放（左右14像素不变，中间缩放）
//        let imgTrackRight = UIImage(named:"同意协议")
//        let imgRight = imgTrackRight!.stretchableImage(withLeftCapWidth: 14, topCapHeight:0)
//        slider.setMaximumTrackImage(imgRight, for: .normal)
        
        self.button = UIButton.init(type: .system)
        self.button.frame = CGRect.init(x: 50, y: 50, width: 100, height: 20)
        self.button.backgroundColor = .red
        self.view.addSubview(self.button)
        self.button.addTarget(self, action: #selector(updateSlider), for: .touchUpInside)
    }
    
    @objc func updateSlider() -> Void {
        self.slider.setValue(self.slider.value + 0.1,animated:true) // 变更有动画
    }
    
    func learnStepper() {
        // UIStepper 组件大小固定，不会随着你设置的大小改变
        let stepper = UIStepper.init()
        self.view.addSubview(stepper)
        stepper.frame = CGRect.init(x: 50, y: 50, width: 100, height: 40)
        /**
         设置触发频率
         若设置为true，则长按会连续触发变化，若设置为false，只有在按击结束后，才会触发,其值是在随时间增加的。
         */
//        stepper.isContinuous = false
        stepper.addTarget(self, action: #selector(valueChange(_:)), for: .valueChanged)
        /**
         设置步进器是否长按触发事件
         若设置为YES，则长按值会一直改变，若设置为NO，则一次点击只会改变一次值,其值不随长按时间变化。
         */
        stepper.autorepeat = false
        stepper.maximumValue = 10000
        stepper.minimumValue = 1
        /**
         设置控制器其值是否循环
         设置控制器的值是否循环(到达边界后，重头开始，默认为false)
         */
        stepper.wraps = true
        /**
         设置步进器的初始值
         */
        stepper.value = 3

        /**
         设置步进器的步进梯度
         每点按一次，其值就按梯度增加
         */
        stepper.stepValue = 2
        
        /**
         设置加减号的图片
         */
        stepper.setIncrementImage(UIImage.init(named: "设备选择.png"), for: .normal)
        stepper.setIncrementImage(UIImage.init(named: "同意协议.png"), for: .highlighted)
        stepper.setDecrementImage(UIImage.init(named: "设备选择.png"), for: .normal)
        stepper.setDecrementImage(UIImage.init(named: "同意协议.png"), for: .highlighted)
        stepper.tintColor = .yellow
        
        self.label = UILabel.init()
        self.label.frame = CGRect.init(x: 50, y: 100, width: 200, height: 30)
        self.view.addSubview(self.label)
    }
    
    /**
     步进器值的获取
     */
    @objc func valueChange(_ stepper:UIStepper) -> Void {
        self.label.text = "当前数值：\(stepper.value)"
    }
    
    func learnSwitch() {
        // switch 大小也是固定不变的
        let wctswitch = UISwitch.init()
        wctswitch.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100);
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
    
    func learnProcessView () {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.center = self.view.center
        progressView.progress = 0.1 //默认进度50%
        self.view.addSubview(progressView)
        
        // 设置进度，同时有动画效果
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            progressView.setProgress(0.9, animated:true)
        }
        progressView.progressTintColor = .green //已有进度颜色
        progressView.trackTintColor = .blue //剩余进度颜色（即进度槽颜色）
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
