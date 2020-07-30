//
//  WCTSettingViewController.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/29.
//  Copyright © 2020 wct. All rights reserved.
//

import UIKit
import Kingfisher

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
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:  // 清理缓存
                calculateDiskCashSize(cell)
            case 2:  // 摘要
                cell.selectionStyle = .none
            default: break
            }
        
        default: break
        }
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
        let cell = tableView.cellForRow(at: indexPath) as! WCTSettingCell
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:  // 清理缓存
                clearCacheAlertController(cell)
            case 1:  // 设置字体大小
                setupFontAlertController(cell)
            case 3:  // 非 WiFi 网络流量
                setupNetworkAlertController(cell)
            case 4:  // 非 WiFi 网络播放提醒
                setupPlayNoticeAlertController(cell)
            default: break
            }
//        case 1:
//            switch indexPath.row {
//            case 0:  // 离线下载
//                let offlineDownloadVC = OfflineDownloadController()
//                offlineDownloadVC.navigationItem.title = "离线下载"
//                navigationController?.pushViewController(offlineDownloadVC, animated: true)
//            default: break
//            }
        default: break
        }
    }
}


extension WCTSettingViewController {
    /// 非 WiFi 网络播放提醒
    @objc fileprivate func changePlayNotice(notification: Notification) {
        let userInfo = notification.userInfo as! [String: AnyObject]
        let indexPath = IndexPath(row: 4, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! WCTSettingCell
        cell.rightTitleLabel.text = userInfo["playNotice"] as? String
    }
    /// 非 WiFi 网络播放提醒
    fileprivate func setupPlayNoticeAlertController(_ cell: WCTSettingCell) {
        let alertController = UIAlertController(title: "非 WiFi 网络播放提醒", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let everyAction = UIAlertAction(title: "每次提醒", style: .default, handler: { (_) in
            cell.rightTitleLabel.text = "每次提醒"
        })
        let onceAction = UIAlertAction(title: "提醒一次", style: .default, handler: { (_) in
            cell.rightTitleLabel.text = "提醒一次"
        })
        alertController.addAction(cancelAction)
        alertController.addAction(everyAction)
        alertController.addAction(onceAction)
        present(alertController, animated: true, completion: nil)
    }
    /// 非 WiFi 网络流量
    @objc fileprivate func changeNetworkMode(notification: Notification) {
        let userInfo = notification.userInfo as! [String: AnyObject]
        let indexPath = IndexPath(row: 3, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! WCTSettingCell
        cell.rightTitleLabel.text = userInfo["networkMode"] as? String
    }
    /// 非 WiFi 网络流量
    fileprivate func setupNetworkAlertController(_ cell: WCTSettingCell) {
        let alertController = UIAlertController(title: "非 WiFi 网络流量", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let bestAction = UIAlertAction(title: "最小效果（下载大图）", style: .default, handler: { (_) in
            cell.rightTitleLabel.text = "最小效果（下载大图）"
        })
        let betterAction = UIAlertAction(title: "较省流量（智能下图）", style: .default, handler: { (_) in
            cell.rightTitleLabel.text = "较省流量（智能下图）"
        })
        let leastAction = UIAlertAction(title: "极省流量（智能下图）", style: .default, handler: { (_) in
            cell.rightTitleLabel.text = "极省流量（智能下图）"
        })
        alertController.addAction(cancelAction)
        alertController.addAction(bestAction)
        alertController.addAction(betterAction)
        alertController.addAction(leastAction)
        present(alertController, animated: true, completion: nil)
    }
    /// 改变字体大小
    @objc fileprivate func changeFontSize(notification: Notification) {
        let userInfo = notification.userInfo as! [String: AnyObject]
        let indexPath = IndexPath(row: 1, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! WCTSettingCell
        cell.rightTitleLabel.text = userInfo["fontSize"] as? String
    }
    /// 设置字体大小
    fileprivate func setupFontAlertController(_ cell: WCTSettingCell) {
        let alertController = UIAlertController(title: "设置字体大小", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let smallAction = UIAlertAction(title: "小", style: .default, handler: { (_) in
            cell.rightTitleLabel.text = "小"
        })
        let middleAction = UIAlertAction(title: "中", style: .default, handler: { (_) in
            cell.rightTitleLabel.text = "中"
        })
        let bigAction = UIAlertAction(title: "大", style: .default, handler: { (_) in
            cell.rightTitleLabel.text = "大"
        })
        let largeAction = UIAlertAction(title: "特大", style: .default, handler: { (_) in
            cell.rightTitleLabel.text = "特大"
        })
        alertController.addAction(cancelAction)
        alertController.addAction(smallAction)
        alertController.addAction(middleAction)
        alertController.addAction(bigAction)
        alertController.addAction(largeAction)
        present(alertController, animated: true, completion: nil)
    }
    
    /// 从沙盒中获取缓存数据的大小
    fileprivate func calculateDiskCashSize(_ cell: WCTSettingCell) {
        let cache = KingfisherManager.shared.cache
        cache.calculateDiskCacheSize { (size) in
            // 转换成 M
            let sizeM = Double(size) / 1024.0 / 1024.0
            cell.rightTitleLabel.text = String(format: "%.2fM", sizeM)
        }
    }
    /// 获取缓存大小显示到 cell
    @objc fileprivate func loadCacheSize(notification: Notification) {
        let userInfo = notification.userInfo as! [String: AnyObject]
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableView.cellForRow(at: indexPath) as! WCTSettingCell
        cell.rightTitleLabel.text = userInfo["cacheSize"] as? String
    }
    /// 弹出清理缓存的提示框
    fileprivate func clearCacheAlertController(_ cell: WCTSettingCell) {
        let alertController = UIAlertController(title: "确定清除所有缓存？问答草稿、离线下载及图片均会被清除", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "确定", style: .default, handler: { (_) in
            let cache = KingfisherManager.shared.cache
            cache.clearDiskCache()
            cache.clearMemoryCache()
            cache.cleanExpiredDiskCache()
            cell.rightTitleLabel.text = "0.00M"
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

/// 读取plist data
extension WCTSettingViewController {
    /// 设置 UI
    fileprivate func setupUI() {
        // pilst 文件的路径
        let path = Bundle.main.path(forResource: "WCTSetting", ofType: "plist")
        // plist 文件中的数据
        let cellPlist = NSArray(contentsOfFile: path!) as! [Any]
        /// 使用 flatMap 替换 for 循环
        sections = cellPlist.flatMap({ section in
            (section as! [Any]).flatMap({ row in
                WCTSettingModel.deserialize(from: row as! NSDictionary)
            })
        })
        tableView.wct_registerCell(cell: WCTSettingCell.self)
        tableView.rowHeight = 44
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.theme_backgroundColor = "colors.tableViewBackgroundColor"
    }
}
