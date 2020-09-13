//
//  WCTScrollHeaderView.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/9/10.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit
import IBAnimatable

class WCTScrollHeaderView: UIView, UITableViewDelegate, UITableViewDataSource {

    /// 隐藏和显示处理的 label（需要处理 height 、 top、hidden 以及需改高度）
    @IBOutlet weak var addTitle: UILabel!
    @IBOutlet weak var addTitleTop: NSLayoutConstraint!
    @IBOutlet weak var addTitleHeight: NSLayoutConstraint!
    /// 折叠按钮
    @IBOutlet weak var unFoldButton: UIButton!
    /// 顶部图片
    @IBOutlet weak var topImageV: UIImageView!
    @IBOutlet weak var tabBgView: UIView!
    /// 折叠展开文字
    @IBOutlet weak var moreTitle: UILabel!
    @IBOutlet weak var moreTitleHeight: NSLayoutConstraint!
    /// tab 滚动
    @IBOutlet weak var scrollView: AnimatableScrollView!
    /// 底部滚动View
    @IBOutlet weak var bottomScrollView: UIScrollView!
    /// 定义一个临时变量button
    var selestButton = UIButton()
    /// 定义的数值
    let buttonWidth : Int = 100;
    let buttonHeight : Int = 44;
    let count : Int = 5;
    let indicatorViewWidth : Int = 20;
    let bottomScrollViewHeight : Int = 808;
    
    class func headerView() -> WCTScrollHeaderView {
        return Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)?.last as! WCTScrollHeaderView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /// tab 直接mock count个数据：正常的话通过赋值model，取model里面的值去动态显示tab数量
        for index in 0...count {
            /// 上面tabbar
            let button = UIButton.init(frame: CGRect.init(x: index * buttonWidth, y: 0, width: buttonWidth, height: buttonHeight))
            button.setTitle("按钮\(index)", for: .normal)
            button.setTitleColor(.red, for: .selected)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(bottomTabButtonClicked), for: .touchUpInside)
            scrollView.addSubview(button)
            if index == 0 {
                button.isSelected = true
                selestButton = button
            }
            
            // 添加 tableView
            let tableView = UITableView(frame: CGRect.init(x: index * Int(screenWidth), y: 0, width: Int(screenWidth), height: bottomScrollViewHeight))
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 44, right: 0)
//            if index % 2 == 0 { tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 44, right: 0) }
            tableView.delegate = self
            tableView.dataSource = self
            tableView.wct_registerCell(cell: WCTScrollCell.self)
            if index % 2 == 0 {
                tableView.backgroundColor = .green
            } else {
                tableView.backgroundColor = .blue
            }
//            tableView.isScrollEnabled = false
            tableView.bounces = false
            tableView.showsVerticalScrollIndicator = false
            tableView.showsHorizontalScrollIndicator = false
            tableView.separatorStyle = .none
            tableView.tableFooterView = UIView()
            bottomScrollView.addSubview(tableView)
            if index == count - 1 {
                scrollView.contentSize = CGSize.init(width: buttonWidth * count, height: buttonHeight)
                scrollView.contentOffset = CGPoint.init(x: 0, y: 0)
                bottomScrollView.contentSize = CGSize.init(width: Int(screenWidth) * count, height: bottomScrollViewHeight)
                bottomScrollView.contentOffset = CGPoint.init(x: 0, y: 0)
            }
        }
        
        scrollView.addSubview(self.indicatorView)
        
        self.layoutIfNeeded()
    }

    
    /// tab 点击事件
    @objc func bottomTabButtonClicked(button : UIButton) {
        selestButton.isSelected = false
        button.isSelected = !button.isSelected
        UIView.animate(withDuration: 0.25, animations: {
            self.indicatorView.centerX = button.centerX
        }) { (_) in
            self.selestButton = button
        }
    }
    
    /// 懒加载滚动条
    lazy var indicatorView : UIView = {
        let indicatorView = UIView.init(frame: CGRect(x: (buttonWidth - indicatorViewWidth) / 2, y: buttonHeight - 2, width: indicatorViewWidth, height: 2))
        indicatorView.backgroundColor = .red
        return indicatorView
    }()
    
    @IBAction func didClickUnfoldButton(_ sender: Any) {
        unFoldButton.isSelected = !unFoldButton.isSelected
        if unFoldButton.isSelected {
            /// 隐藏：
//            addTitle.isHidden = true
//            addTitleTop.constant = 0
//            addTitleHeight.constant = 0
            
            moreTitle.numberOfLines = 0;
            moreTitleHeight.constant = 101;
            
            self.layoutIfNeeded()
        } else {
            /// 显示：
//            addTitle.isHidden = false
//            addTitleTop.constant = 10
//            addTitleHeight.constant = 21
            
            moreTitle.numberOfLines = 1;
            moreTitleHeight.constant = 21;
            
            self.layoutIfNeeded()
        }
    }
}


extension WCTScrollHeaderView {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.wct_dequeueReusableCell(indexPath: indexPath) as WCTScrollCell
        cell.titleLabel.text = "\(indexPath.row) 下标"
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for subview in bottomScrollView.subviews {
            let tableView = subview as! UITableView
            if tableView.contentOffset.y == 0 {
                tableView.isScrollEnabled = false
            }
        }
    }
}
