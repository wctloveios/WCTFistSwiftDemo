//
//  LearnSliderViewController.swift
//  WCTFirstSwiftDemo
//
//  Created by wct on 2020/7/2.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class LearnSliderViewController: UIViewController {
    
    var slider :UISlider!
    var button :UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.learnSlider()
        // Do any additional setup after loading the view.
    }
    
    
    func learnSlider() {
        self.slider = UISlider.init()
        self.slider.frame = CGRect.init(x: 50, y: 200, width: 300, height: 20)
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
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
