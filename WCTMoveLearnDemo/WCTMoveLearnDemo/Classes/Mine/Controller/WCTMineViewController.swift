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
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        let section = sections[indexPath.section]
        let myCellModel = section[indexPath.row]
        cell.textLabel?.text = myCellModel.text
        return cell
    }
    
    // 设置 HeadeView
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 10))
        view.backgroundColor = UIColor.globalBackgroupColor()
        return view
    }
}
