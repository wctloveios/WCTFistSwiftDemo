//
//  WCTMineViewController.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/16.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

class WCTMineViewController: UITableViewController {
    
    // 数组最好指定为具体类型包含零个元素
    var sectionsDataArray = [[WCTMineCellModel]]()
    var fansDataArray = [WCTMineFansModel]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = headView
        tableView.backgroundColor = UIColor.globalBackgroupColor()
        tableView.separatorStyle = .none
        
        // 使用扩展方法：cell 同时z遵守协议
        tableView.wct_registerCell(cell: WCTMineCell.self)
        tableView.wct_registerCell(cell: WCTMineFansCell.self)
        
        // 或者我的cell的数据
        WCTNetworkTool.loadMycellData { (data) in
            self.sectionsDataArray = data
            self.tableView.reloadData()
            
            WCTNetworkTool.loadMyFans { (fansData) in
                self.fansDataArray = fansData
                let indexSet = IndexSet(integer: 0)
                self.tableView.reloadSections(indexSet, with: .automatic)
            }
        }
    }
    
    
    /// 文件私有、懒加载
    fileprivate lazy var headView: WCTMineHeaderView = {
        let headView = WCTMineHeaderView.headerView()
        return headView
    }()
    
    
    /// 设置状态栏
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension WCTMineViewController {
    
    // 设置 cell
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsDataArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsDataArray[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// 我的关注
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.wct_dequeueReusableCell(indexPath: indexPath) as WCTMineFansCell
            let section = sectionsDataArray[indexPath.section]
            // 整个cell 设置一个model 属性
            cell.myCellModel = section[indexPath.row]
            
            if fansDataArray.count <= 1 {
                cell.collectionView.isHidden = true
            }
            
            if fansDataArray.count == 1 {
                cell.myFan = fansDataArray[0]
            }
            
            if fansDataArray.count > 1 {
                cell.myFansArray = fansDataArray
            }
            
            return cell
        }
        
        /// 其他
        let cell = tableView.wct_dequeueReusableCell(indexPath: indexPath) as WCTMineCell
        let section = sectionsDataArray[indexPath.section]
        let myCellModel = section[indexPath.row]
        cell.titleLabel?.text = myCellModel.text
        cell.detailLabel?.text = myCellModel.gray_text
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return fansDataArray.count <= 1 ? 40 : 144
        }
        
        return 40
    }
    
    // 设置 Heade
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 0 : 10
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 10))
        view.backgroundColor = UIColor.globalBackgroupColor()
        return view
    }
    
    // 点击cell
    
//    /// 设置滚动缩放
//    /// - Parameter scrollView: id <scrollView>
//    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetY = scrollView.contentOffset.y
//        if offsetY < 0 {
//            let totalOffset = Kmine_headerView_height + abs(offsetY)
//            let f = totalOffset / Kmine_headerView_height
//            headView.bgImageV.frame = CGRect(x: -screenWidth * (f - 1) * 0.5, y: offsetY, width: screenWidth * f, height: totalOffset)
//            print(totalOffset)
//        }
//    }
}
