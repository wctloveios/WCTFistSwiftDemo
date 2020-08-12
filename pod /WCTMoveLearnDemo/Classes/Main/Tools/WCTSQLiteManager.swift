//
//  SQLiteManager.swift
//  News
//
//  Created by 杨蒙 on 2017/10/6.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import Foundation
import SQLite

struct WCTSQLiteManager {
    
    var database: Connection!
    
    init() {
        do {
            let path = NSHomeDirectory() + "/Documents/news.sqlite3"
            database = try Connection(path)
        } catch {
            print(error)
        }
    }
    
}

/// 首页新闻分类的标题数据表
struct NewsTitleTable {
    
    /// 数据库管理者
    private let sqlManager = WCTSQLiteManager()
    /// 新闻标题 表
    private let news_title = Table("news_title")
    /// 表字段
    let id = Expression<Int64>("id")
    let titleStr = Expression<String>("titleStr")
    let subtitleStr = Expression<String>("subtitleStr")
    let selected = Expression<Bool>("selected")
    
    init() {
        do {
            // 建表
            try sqlManager.database.run(news_title.create(ifNotExists: true, block: { t in
                t.column(id, primaryKey: true)
                t.column(titleStr)
                t.column(subtitleStr)
                t.column(selected)
            }))
        } catch {
            print(error)
        }
    }
    
    /// 插入一组数据
    func insert(_ titles: [WCTHomeTitleModel]) {
        // 遍历
//        for title in titles {
//            insert(title)
//        }
        _ = titles.map { insert($0) }
    }
    /// 插入一条数据
    func insert(_ title: WCTHomeTitleModel) {
        /// 如果数据库中该条数据数据不存在，就插入
        if !exist(title) {
            let insert = news_title.insert(titleStr <- title.titleStr, subtitleStr <- title.subtitleStr, selected <- title.selected)
            do {
                /// 插入数据
                try sqlManager.database.run(insert)
            } catch {
                print(error)
            }
        }
    }
    
    /// 判断数据库中某一条数据是否存在
    func exist(_ title: WCTHomeTitleModel) -> Bool {
        // 取出该新闻分类标题的数据
        let title = news_title.filter(titleStr == title.titleStr)
        do {
            // 判断该条数据是否存在，没有直接的方法
            // 可以根据 count 是否是 0 来判断是否存在这条数据，0 表示没有该条数据，1 表示存在该条数据
            let count = try sqlManager.database.scalar(title.count)
            return count != 0
        } catch {
            print(error)
        }
        return false
    }
    
    /// 查询所有数据
    func selectAll() -> [WCTHomeTitleModel] {
        
//        var allTitles = [HomeNewsTitle]()
        do {
            // 遍历表中数据
//            for title in try sqlManager.database.prepare(news_title) {
//                // 取出表中数据，并初始化为一个结构体模型
//                let newsTitle = HomeNewsTitle(category: title[category], tip_new: Int(title[tip_new]), default_add: Int(title[default_add]), web_url: title[web_url], concern_id: title[concern_id], icon_url: title[icon_url], flags: Int(title[flags]), type: Int(title[type]), name: title[name], selected: title[selected])
//                // 添加到数组中
//                allTitles.append(newsTitle)
//            }
            return try sqlManager.database.prepare(news_title).map({ title in
                // 取出表中数据，并初始化为一个结构体模型
                WCTHomeTitleModel(titleStr: title[titleStr], subtitleStr: title[subtitleStr], selected: title[selected])
            })
//            return allTitles
        } catch {
            print(error)
        }
        return []
    }
    
    /// 更新数据
    func update(_ newsTitle: WCTHomeTitleModel) {
        do {
            // 取出数据库中数据
            let title = news_title.filter(titleStr == newsTitle.titleStr)
            // 更新数据
            try sqlManager.database.run(title.update(selected <- newsTitle.selected))
        } catch {
            print(error)
        }
    }
    
}


