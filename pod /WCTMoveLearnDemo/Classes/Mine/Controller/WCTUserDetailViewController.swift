//
//  WCTUserDetailViewController.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/8/14.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

class WCTUserDetailViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bottomView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.scrollView.addSubview(self.headerView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    /// 改变状态栏的字体颜色
    var changeStatusBarStyle: UIStatusBarStyle = .lightContent {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
        /// 懒加载 头部
    fileprivate lazy var headerView: UserDetailHeaderView = {
        let headerView = UserDetailHeaderView.loadViewFromNib()
        return headerView
    }()
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


//extension UserDetailViewController: UserDetailBottomViewDelegate {
//    
//    // bottomView 底部按钮的点击
//    func bottomView(clicked button: UIButton, bottomTab: BottomTab) {
//        let bottomPushVC = UserDetailBottomPushController()
//        bottomPushVC.navigationItem.title = "网页浏览"
//        if bottomTab.children.count == 0 { // 直接跳转到下一控制器
//            bottomPushVC.url = bottomTab.value
//            navigationController?.pushViewController(bottomPushVC, animated: true)
//        } else { // 弹出 子视图
//            // 创建 Storyboard
//            let sb = UIStoryboard(name: "\(UserDetailBottomPopController.self)", bundle: nil)
//            // 创建 UserDetailBottomPopController
//            let popoverVC = sb.instantiateViewController(withIdentifier: "\(UserDetailBottomPopController.self)") as! UserDetailBottomPopController
//            popoverVC.children = bottomTab.children
//            popoverVC.modalPresentationStyle = .custom
//            popoverVC.didSelectedChild = { [weak self] in
//                bottomPushVC.url = $0.value
//                self!.navigationController?.pushViewController(bottomPushVC, animated: true)
//            }
//            let popoverAnimator = PopoverAnimator()
//            // 转化 frame
//            let rect = myBottomView.convert(button.frame, to: view)
//            let popWidth = (screenWidth - CGFloat(userDetail!.bottom_tab.count + 1) * 20) / CGFloat(userDetail!.bottom_tab.count)
//            let popX = CGFloat(button.tag) * (popWidth + 20) + 20
//            let popHeight = CGFloat(bottomTab.children.count) * 40 + 25
//            popoverAnimator.presetnFrame = CGRect(x: popX, y: rect.origin.y - popHeight, width: popWidth, height: popHeight)
//            popoverVC.transitioningDelegate = popoverAnimator
//            present(popoverVC, animated: true, completion: nil)
//        }
//    }
//    
//}
