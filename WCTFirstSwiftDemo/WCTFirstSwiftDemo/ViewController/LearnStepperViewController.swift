//
//  LearnStepperViewController.swift
//  WCTFirstSwiftDemo
//
//  Created by wct on 2020/7/2.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class LearnStepperViewController: UIViewController {
    
    var label :UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.learnStepper()
        // Do any additional setup after loading the view.
    }
    
    
    func learnStepper() {
        // UIStepper 组件大小固定，不会随着你设置的大小改变
        let stepper = UIStepper.init()
        self.view.addSubview(stepper)
        stepper.frame = CGRect.init(x: 50, y: 200, width: 100, height: 40)
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
        self.label.frame = CGRect.init(x: 50, y: 300, width: 200, height: 30)
        self.view.addSubview(self.label)
    }
    
    /**
     步进器值的获取
     */
    @objc func valueChange(_ stepper:UIStepper) -> Void {
        self.label.text = "当前数值：\(stepper.value)"
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
