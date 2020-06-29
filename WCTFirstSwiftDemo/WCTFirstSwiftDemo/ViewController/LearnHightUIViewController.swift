//
//  LearnHightUIViewController.swift
//  WCTFirstSwiftDemo
//
//  Created by wct on 2020/6/28.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

let cell_identifier: String = "Cell"

class LearnHightUIViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var infoTableView:UITableView? = nil    //声明tableView变量
    var itemArr:NSMutableArray = []         //声明可变数组变量
    var isShowEdit:Bool? = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.createSubViews()
    }
    
    @objc func buttonItemAction(_ item: UIBarButtonItem) {
        if item.tag == 2000 {
            self.isShowEdit = true
        } else if item.tag == 1000 {
            self.isShowEdit = false
        }
        self.infoTableView?.reloadData()
    }
    
    func createSubViews() {
        self.view.backgroundColor = .white
        let selectedAll = UIBarButtonItem(title: "取消", style: .done, target: self, action: #selector(buttonItemAction(_:)));
        selectedAll.tag = 1000;
        
        let edit = UIBarButtonItem(title: "编辑", style: .plain, target: self, action: #selector(buttonItemAction(_:)));
        edit.tag = 2000;
        self.navigationItem.rightBarButtonItems = [edit,selectedAll];
        
        self.itemArr = NSMutableArray.init(array: ["郑州","开封","洛阳","焦作","新乡","周口","济源","漯河","信阳","安阳","许昌","郑州1","开封1","洛阳1","焦作1","新乡1","周口1","济源1","漯河1","信阳1","安阳1","许昌1"])
        //UITableView 初始化
        self.infoTableView = UITableView (frame: self.view.frame, style: .plain)
        self.infoTableView?.tableFooterView = UIView()
        self.infoTableView?.dataSource = self
        self.infoTableView?.delegate = self
        self.infoTableView?.setEditing(true, animated: true)
        self.view.addSubview(self.infoTableView!)
        
        //注册 cell
//        self.infoTableView?.register(UITableViewCell.self, forCellReuseIdentifier: cell_identifier)
        self.infoTableView?.register(LearnTableViewCell.self, forCellReuseIdentifier: cell_identifier)
//        var nib = UINib(nibName: "SepetTableCell", bundle: nil)
//        self.sepetTable.registerNib(nib, forCellReuseIdentifier: "productCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell_identifier, for: indexPath)
        cell.textLabel?.text = (itemArr[indexPath.row] as! String)
//        cell.backgroundColor = UIColor.init(red: 0.1, green: 0.5, blue: 0.5, alpha: 0.3)
        return cell
    }
    
    //选中某个 cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell点击响应")
    }
    
    //如果需要实现cell按下高亮，手放开恢复原状态，则实现如下方法即可：
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //是否允许cell进行编辑 默认允许
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return self.isShowEdit ?? true
    }
    
    //是否允许cell排序
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return self.isShowEdit ?? true
    }
    
    //cell排序操作
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        self.infoTableView?.moveRow(at: sourceIndexPath, to: destinationIndexPath)
        self.itemArr.exchangeObject(at: sourceIndexPath.row, withObjectAt: destinationIndexPath.row)
        print("cell排序响应！")
    }
    
    //分割线从左端顶部显示(使cell的)分割线与屏幕的左右两端对齐显示
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if(cell.responds(to: #selector(setter: UITableViewCell.separatorInset))){
            cell.separatorInset = .zero
        }
        if(cell.responds(to: #selector(setter: UITableViewCell.layoutMargins))){
            
            cell.layoutMargins = .zero
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        //单独删除单元格
        if editingStyle ==  UITableViewCell.EditingStyle.delete{
            self.itemArr.remove(indexPath.row)
            tableView.deleteRows(at: [indexPath], with:.top)
            print("单独删除cell单元格响应！")
            let alertCon = UIAlertController.init(title: "提示", message: "您正在进行UItableViewCell的删除操作，是否删除？", preferredStyle:UIAlertController.Style.actionSheet)
            let doneAction = UIAlertAction.init(title: "删除", style: UIAlertAction.Style.destructive, handler: { (UIAlertAction) -> Void in
                print("alertView确定响应！")
            })
            
            let cancleAction = UIAlertAction.init(title: "放弃", style: UIAlertAction.Style.default, handler: { (UIAlertAction) -> Void in
                print("alertView取消响应！")
            })
            
            alertCon.addAction(doneAction)
            alertCon.addAction(cancleAction)
            self.present(alertCon, animated: true, completion: nil)
            //插入一个单元格数据
        } else if editingStyle == UITableViewCell.EditingStyle.insert{
            print("insert响应！")
            let alertCon = UIAlertController.init(title: "提示", message: "您正在进行UItableViewCell的插入操作？", preferredStyle:UIAlertController.Style.alert)
            let doneAction = UIAlertAction.init(title: "确定", style: UIAlertAction.Style.default, handler: { (UIAlertAction) -> Void in
                print("alertView确定响应！")
                self.itemArr .insert("郑州(新增)", at: indexPath.row)
                self.infoTableView?.reloadData()
            })
            let cancleAction = UIAlertAction.init(title: "取消", style: UIAlertAction.Style.default, handler: { (UIAlertAction) -> Void in
                print("alertView取消响应！")
            })
            alertCon.addAction(doneAction)
            alertCon.addAction(cancleAction)
            self.present(alertCon, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle{
        return UITableViewCell.EditingStyle.delete
    }
    
//    @objc func didClickButton () {
//        self.showAlert()
//    }
    
    //显示弹出框信息
    func showAlert() {
        let alert = UIAlertController(title: "标题", message: "显示内容",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .cancel))
        self.present(alert, animated: true)
    }
}
