//
//  LearnProcessViewViewController.swift
//  WCTFirstSwiftDemo
//
//  Created by wct on 2020/7/2.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class LearnProcessViewViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.learnProcessView()
        // Do any additional setup after loading the view.
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
