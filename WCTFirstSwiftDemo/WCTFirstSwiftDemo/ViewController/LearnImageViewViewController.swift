//
//  LearnImageViewViewController.swift
//  WCTFirstSwiftDemo
//
//  Created by wct on 2020/7/2.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class LearnImageViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        self.learnImageView()
    }
    
    func learnImageView() {
        //初始化一个imageView
        let imageView  = UIImageView.init(frame: self.view.frame)
        self.view.addSubview(imageView)
        imageView.backgroundColor = .red
        //设置imageView的图片
        imageView.image = UIImage.init(named: "imageViewMode")
        //设置图片显示模式，具体可以command contentMode看详细属性，一般用来处理图片的变形问题
        imageView.contentMode = .scaleAspectFit
        
        
        let testImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 200, width: 200, height: 200))
        self.view.addSubview(testImageView)
        //设置imageView的中心位置
        testImageView.center = CGPoint.init(x: 200, y: 100)
        //获取图片序列数组
        let imagesArray = NSMutableArray.init()
        for i in 1...2 {
            // 需要注意的事，动画的图片需要大小一致，不一致会运行不成功
            let image = UIImage.init(named: String.init(format: "photo%d", i))
            imagesArray.add(image as Any)
        }
        //设置动画数组
        testImageView.animationImages = imagesArray as? [UIImage]
        //设置动画时长
        testImageView.animationDuration = 1.2
        //设置动画播放次数，0表示无限次
        testImageView.animationRepeatCount = 0
        //开始动画
        testImageView.startAnimating()
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
