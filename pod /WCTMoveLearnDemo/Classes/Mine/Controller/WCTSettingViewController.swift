//
//  WCTSettingViewController.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/29.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

class WCTSettingViewController: UITableViewController {

    /// dataSource
    var  sections = [[WCTSettingModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置 UI
        setupUI()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = sections[section]
        return rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.wct_dequeueReusableCell(indexPath: indexPath) as WCTSettingCell
        let rows = sections[indexPath.section]
        cell.setting = rows[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 10))
        view.theme_backgroundColor = "colors.tableViewBackgroundColor"
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension WCTSettingViewController {
    /// 设置 UI
    fileprivate func setupUI() {
        // pilst 文件的路径
        let path = Bundle.main.path(forResource: "WCTSetting", ofType: "plist")
        // plist 文件中的数据
        let cellPlist = NSArray(contentsOfFile: path!) as! [Any]
        for dicts in cellPlist {
            let array = dicts as! [[String: Any]]
            var rows = [WCTSettingModel]()
            for dict in array {
                let setting = WCTSettingModel.deserialize(from: dict as NSDictionary)
                rows.append(setting!)
            }
            sections.append(rows)
        }
        tableView.wct_registerCell(cell: WCTSettingCell.self)
        tableView.rowHeight = 44
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.theme_backgroundColor = "colors.tableViewBackgroundColor"
    }
}
