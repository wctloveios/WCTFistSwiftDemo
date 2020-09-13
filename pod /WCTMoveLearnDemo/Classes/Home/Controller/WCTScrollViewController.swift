//
//  WCTScrollViewController.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/9/10.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

class WCTScrollViewController: UIViewController {

    /// 主scrollView
    @IBOutlet weak var scrollView: UIScrollView!
    /// 底部tab
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomViewHeight: NSLayoutConstraint!
    @IBOutlet weak var bottomViewBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        ///初始设置一个预估 height
        let bottomHeight: CGFloat = isIPhoneX ? 44 + 34 : 44
        // safeArea 设置约束，避免顶到便捷
        bottomViewBottom.constant = isIPhoneX ? -34 : 0
        scrollView.contentSize = CGSize.init(width: screenWidth, height: screenHeight + 294 - bottomHeight)
        view.layoutIfNeeded()
        
        /// 添加 headerView
        scrollView.addSubview(self.headerView)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    lazy var headerView : WCTScrollHeaderView = {
        /// 这边需要注意不能直接使用 WCTScrollHeaderView()，而是需要使用类方法 headerView() 去加载xib
        let headerView = WCTScrollHeaderView.headerView()
        /// 
        headerView.frame = CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight + 294);
        return headerView
    }()
}

/// 添加扩展
extension WCTScrollViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        // 图片黏住顶部，拉伸
        if offsetY < -44 {
            let totalOffset = kUserDetailHeaderBGImageViewHeight + abs(offsetY)
            let f = totalOffset / kUserDetailHeaderBGImageViewHeight
            headerView.topImageV.frame = CGRect(x: -screenWidth * (f - 1) * 0.5, y: offsetY, width: screenWidth * f, height: totalOffset)
//            navigationBar.backgroundColor = UIColor(white: 1.0, alpha: 0.0)
        } else {
//            for subview in headerView.bottomScrollView.subviews {
//                let tableView = subview as! UITableView
//                tableView.isScrollEnabled = false
//            }
//            var alpha: CGFloat = (offsetY + 44) / 58
//            alpha = min(alpha, 1.0)
//            navigationBar.backgroundColor = UIColor(white: 1.0, alpha: alpha)
//            if alpha == 1.0 {
//                changeStatusBarStyle = .default
//                navigationBar.returnButton.theme_setImage("images.personal_home_back_black_24x24_", forState: .normal)
//                navigationBar.moreButton.theme_setImage("images.new_more_titlebar_24x24_", forState: .normal)
//            } else {
//                changeStatusBarStyle = .lightContent
//                navigationBar.returnButton.theme_setImage("images.personal_home_back_white_24x24_", forState: .normal)
//                navigationBar.moreButton.theme_setImage("images.new_morewhite_titlebar_22x22_", forState: .normal)
//            }
//            // 14 + 15 + 14
//            var alpha1: CGFloat = offsetY / 57
//            if offsetY >= 43 {
//                alpha1 = min(alpha1, 1.0)
//                navigationBar.nameLabel.isHidden = false
//                navigationBar.concernButton.isHidden = false
//                navigationBar.nameLabel.textColor = UIColor(r: 0, g: 0, b: 0, alpha: alpha1)
//                navigationBar.concernButton.alpha = alpha1
//            } else {
//                alpha1 = min(0.0, alpha1)
//                navigationBar.nameLabel.textColor = UIColor(r: 0, g: 0, b: 0, alpha: alpha1)
//                navigationBar.concernButton.alpha = alpha1
//            }
            /// 设置 headerView 的 topTab 黏住顶部
            // 14 + headerView.topTabView.frame.minY(201)
            let topViewH: CGFloat = headerView.tabBgView.frame.minY - 44
            print("\(topViewH) - \(offsetY)")
            if offsetY >= topViewH {
                headerView.y = offsetY - topViewH
//                for subview in headerView.bottomScrollView.subviews {
//                    let tableView = subview as! UITableView
//                    tableView.isScrollEnabled = true
//                }
            } else {
                headerView.y = 0
            }
        }
    }
    
}
