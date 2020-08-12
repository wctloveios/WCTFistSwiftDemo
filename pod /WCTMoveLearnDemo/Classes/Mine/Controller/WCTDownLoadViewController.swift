//
//  WCTDownLoadViewController.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/8/3.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit

class WCTDownLoadViewController: UITableViewController {
    // 标题数组
    fileprivate var titles = [WCTHomeTitleModel]()
    // 标题数据表
    fileprivate let newsTitleTable = NewsTitleTable()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.wct_registerCell(cell: WCTOfflineDownlaodCell.self)
        tableView.rowHeight = 44
        tableView.theme_separatorColor = "colors.separatorViewColor"
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.theme_backgroundColor = "colors.tableViewBackgroundColor"
        // 从数据库中取出左右数据，赋值给 标题数组 titles
        titles = newsTitleTable.selectAll()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
        view.theme_backgroundColor = "colors.tableViewBackgroundColor"
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: screenWidth, height: 44))
        label.text = "我的频道"
        label.theme_textColor = "colors.black"
        let separatorView = UIView(frame: CGRect(x: 0, y: 43, width: screenWidth, height: 1))
        separatorView.theme_backgroundColor = "colors.separatorViewColor"
        view.addSubview(separatorView)
        view.addSubview(label)
        return view
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.wct_dequeueReusableCell(indexPath: indexPath) as WCTOfflineDownlaodCell
        let newsTitle = titles[indexPath.row]
        cell.titleLabel.text = newsTitle.titleStr
        cell.rightImageView.theme_image = newsTitle.selected ? "images.air_download_option_press" : "images.air_download_option"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 取出数组中的第 row 个对象
        var homeNewsTitle = titles[indexPath.row]
        // 取反
        homeNewsTitle.selected = !homeNewsTitle.selected
        // 取出 第 row 个 cell
        let cell = tableView.cellForRow(at: indexPath) as! WCTOfflineDownlaodCell
        // 改变 cell 的图片
        cell.rightImageView.theme_image = homeNewsTitle.selected ? "images.air_download_option_press" : "images.air_download_option"
        // 替换数组中的数据
        titles[indexPath.row] = homeNewsTitle
        // 更新数据库中的数据
        newsTitleTable.update(homeNewsTitle)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}
