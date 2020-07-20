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
    static func loadMyConcern()
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
        var model3 = WCTMineCellModel()
        model3.text = "京东特供"
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
    static func loadMyConcern() {

    }
}

struct WCTNetworkTool: WCTNetworkProtocol {

}
