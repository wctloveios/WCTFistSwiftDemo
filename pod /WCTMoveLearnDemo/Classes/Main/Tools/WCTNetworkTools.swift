//
//  WCTNetworkTools.swift
//  WCTMoveLearnDemo
//
//  Created by wct on 2020/7/17.
//  Copyright © 2020 wct. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol WCTNetworkProtocol {
    // ----------------- 我的 Mine --------------
    // 申明一些列协议方法
    // 1、我的页面 cell 的数据
    /*
     使用闭包，用于外部获取数据
     使用 关键字  @escaping：一个函数执行完成前，可能都不会执行到 此闭包 的话，申明成“逃逸闭包”
     
     */
    static func loadMycellData(completionHandler: @escaping (_ sections: [[WCTMineCellModel]]) -> ())
    
    // 2、我的关注数据
    static func loadMyFans(completionHandler: @escaping (_ sections: [WCTMineFansModel]) -> ())
    
    /// 3、首页title 数据
    static func loadHomeTitleData(completionHandler: @escaping (_ homeTitleSections: [WCTHomeTitleModel]) -> ())
}

extension WCTNetworkProtocol {
    // ----------------- 我的 Mine --------------
    // 数据实现申明的协议方法（一般就放到wxtension中即可）
    
    // 我的页面 cell 的数据
    static func loadMycellData(completionHandler: @escaping (_ sections: [[WCTMineCellModel]]) -> ()) {
        
        /* 1、云端请求方式：
         let url = "https://baidu.com"
         let params = ["device_id": device_id]
         AF.request(url, parameters: params).response { response in
         // 处理云端数据
         }
         */
        
        /*
         2、读取本地json文件
         let path = Bundle.main.path(forResource: "mydata", ofType: "json")
         */

        // 3、直接mock
        var sections = [[WCTMineCellModel]]()
        
        var section0 = [WCTMineCellModel]()
        var section1 = [WCTMineCellModel]()
        var section2 = [WCTMineCellModel]()
        var section3 = [WCTMineCellModel]()
        
        var model0 = WCTMineCellModel()
        model0.text = "我的关注"
        section0.append(model0)
        
        var model1 = WCTMineCellModel()
        model1.text = "消息中心"
        section1.append(model1)
        
        var model2 = WCTMineCellModel()
        model2.text = "头条商城"
        model2.gray_text = "邀请好友得200元现金奖励"
        var model3 = WCTMineCellModel()
        model3.text = "京东特供"
        model3.gray_text = "新人领取188元红包"
        section2.append(model2)
        section2.append(model3)
        
        var model4 = WCTMineCellModel()
        model4.text = "我要报料"
        var model5 = WCTMineCellModel()
        model5.text = "用户反馈"
        var model6 = WCTMineCellModel()
        model6.text = "系统设置"
        section3.append(model4)
        section3.append(model5)
        section3.append(model6)
        
        sections.append(section0)
        sections.append(section1)
        sections.append(section2)
        sections.append(section3)
        
        completionHandler(sections)
    }
    
    // 我的关注数据
    static func loadMyFans(completionHandler: @escaping (_ sections: [WCTMineFansModel]) -> ()) {
        // 3、直接mock
        var sections = [WCTMineFansModel]()
        
        var model0 = WCTMineFansModel()
        model0.name = "兴趣"
        model0.icon = device_icon_url
        sections.append(model0)
        
        var model1 = WCTMineFansModel()
        model1.name = "创业邦"
        model1.icon = device_icon_url
        sections.append(model1)
        
        
        var model2 = WCTMineFansModel()
        model2.name = "新浪乐居"
        model2.icon = device_icon_url
        sections.append(model2)
        
        completionHandler(sections)
    }
    
    /// 3、首页title 数据
    static func loadHomeTitleData(completionHandler: @escaping (_ homeTitleSections: [WCTHomeTitleModel]) -> ()) {
        var homeTitleSections = [WCTHomeTitleModel]()
        var model0 = WCTHomeTitleModel()
        model0.titleStr = "关注"
        model0.subtitleStr = "关注 desc"
        model0.selected = true
        
        var model1 = WCTHomeTitleModel()
        model1.titleStr = "NBA"
        model1.subtitleStr = "NBA desc"
        model1.selected = false
        
        var model2 = WCTHomeTitleModel()
        model2.titleStr = "世界杯"
        model2.subtitleStr = "世界杯 desc"
        model2.selected = true
        
        var model3 = WCTHomeTitleModel()
        model3.titleStr = "视频"
        model3.subtitleStr = "视频 desc"
        model3.selected = false
        
        var model4 = WCTHomeTitleModel()
        model4.titleStr = "电影"
        model4.subtitleStr = "电影 desc"
        model4.selected = true
        
        var model5 = WCTHomeTitleModel()
        model5.titleStr = "电视剧"
        model5.subtitleStr = "电视剧 desc"
        model5.selected = true
        
        var model6 = WCTHomeTitleModel()
        model6.titleStr = "动漫"
        model6.subtitleStr = "动漫 desc"
        model6.selected = true
        
        homeTitleSections.append(model0)
        homeTitleSections.append(model1)
        homeTitleSections.append(model2)
        homeTitleSections.append(model3)
        homeTitleSections.append(model4)
        homeTitleSections.append(model5)
        homeTitleSections.append(model6)
        
        completionHandler(homeTitleSections)
    }
    
    /*
     
     flatMap : 不可为空
     map ： 可为空
     
    /// 我的界面 cell 的数据
    static func loadMyCellData(completionHandler: @escaping (_ sections: [[MyCellModel]]) -> ()) {
        let url = BASE_URL + "/user/tab/tabs/?"
        let params = ["device_id": device_id]
        
        Alamofire.request(url, parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                // 网络错误的提示信息
                return
            }
            if let value = response.result.value {
                let json = JSON(value)
                guard json["message"] == "success" else {
                    return
                }
                if let data = json["data"].dictionary {
                    if let sections = data["sections"]?.arrayObject {
     
                        // 使用flatMap 替换 两层 for循环
                        completionHandler(sections.flatMap({ item in
                            (item as! [Any]).flatMap({ row in
                                MyCellModel.deserialize(from: row as? NSDictionary)
                            })
                        }))
                    }
                }
            }
        }
    }
     
     /// 获取用户详情的动态列表数据
     static func loadUserDetailDongtaiList(user_id: Int, completionHandler: @escaping (_ dongtais: [UserDetailDongtai]) -> ()) {
         
         let url = BASE_URL + "/dongtai/list/v15/?"
         let params = ["user_id": user_id]
         
         Alamofire.request(url, parameters: params).responseJSON { (response) in
             guard response.result.isSuccess else {
                 // 网络错误的提示信息
                 return
             }
             if let value = response.result.value {
                 let json = JSON(value)
                 guard json["message"] == "success" else {
                     return
                 }
                 if let data = json["data"].dictionary {
                     if let datas = data["data"]?.arrayObject {
     
                         // 使用flatMap 替换 一层 for循环
                         completionHandler(datas.flatMap({
                             UserDetailDongtai.deserialize(from: $0 as? NSDictionary)
                         }))
                     }
                 }
             }
         }
     }
 */
    
}

struct WCTNetworkTool: WCTNetworkProtocol {

}
