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
    var sections = [[WCTMineCellModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.globalBackgroupColor()
        tableView.separatorStyle = .none
        
        // 使用扩展方法：cell 同时z遵守协议
        tableView.wct_registerCell(cell: WCTMineCell.self)
        tableView.wct_registerCell(cell: WCTMineFansCell.self)
//        tableView.register(UINib.init(nibName: String(describing: WCTMineCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WCTMineCell.self))
//        tableView.register(UINib.init(nibName: String(describing: WCTMineFansCell.self), bundle: nil), forCellReuseIdentifier: String(describing: WCTMineFansCell.self))
        
        // 或者我的cell的数据
        WCTNetworkTool.loadMycellData { (data) in
            self.sections = data
            self.tableView.reloadData()
        }
    }
}


extension WCTMineViewController {
    
    // 设置 cell
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// 我的关注
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.wct_dequeueResuableCell(indexPath: indexPath) as WCTMineFansCell
            let section = sections[indexPath.section]
            let myCellModel = section[indexPath.row]
            cell.titleLabel?.text = myCellModel.text
            cell.detailLabel?.text = myCellModel.gray_text
            cell.titleLabel?.text = myCellModel.text
            return cell
        }
        
        /// 其他
        let cell = tableView.wct_dequeueResuableCell(indexPath: indexPath) as WCTMineCell
        let section = sections[indexPath.section]
        let myCellModel = section[indexPath.row]
        cell.titleLabel?.text = myCellModel.text
        cell.detailLabel?.text = myCellModel.gray_text
        cell.titleLabel?.text = myCellModel.text
        return cell
    }
    
    // 设置 HeadeView
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 0 : 10
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 10))
        view.backgroundColor = UIColor.globalBackgroupColor()
        return view
    }
    
    // 点击cell
}
