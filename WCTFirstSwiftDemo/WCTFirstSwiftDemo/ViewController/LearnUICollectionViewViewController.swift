//
//  LearnUICollectionViewViewController.swift
//  WCTFirstSwiftDemo
//
//  Created by wct on 2020/7/2.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

let ScreenWidth  = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

class LearnUICollectionViewViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var collectionView : UICollectionView?
    let Identifier       = "LearnCollectionViewCell"
    let headerIdentifier = "LearnCollectionHeaderView"
    let footIdentifier   = "LearnCollectionFootView"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "UICollectionView小解"
        self.view.backgroundColor = UIColor.white
        // 初始化
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: (ScreenWidth - 50) / 2.0 , height: 60)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 20
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
        // 设置分区头视图和尾视图宽高
        layout.headerReferenceSize = CGSize.init(width: ScreenWidth, height: 80)
        layout.footerReferenceSize = CGSize.init(width: ScreenWidth, height: 80)
        
        collectionView = UICollectionView.init(frame: self.view.frame, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .white
        self.view.addSubview(collectionView!)
        
        // 注册cell
        collectionView?.register(LearnCollectionViewCell.self, forCellWithReuseIdentifier: Identifier)
//        collectionView?.register(UINib.init(nibName: "LearnCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Identifier)
        // 注册headerView
        collectionView?.register(LearnCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        // 注册footView
        collectionView?.register(LearnCollectionFootView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footIdentifier)
    }
    
    //    //header高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: ScreenWidth, height: 80)
    }
    //footer高度
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize.init(width: ScreenWidth, height: 80)
    }
    
    //设定header和footer的方法，根据kind不同进行不同的判断即可
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView : LearnCollectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier, for: indexPath) as! LearnCollectionHeaderView
            headerView.view.backgroundColor = .red
            headerView.label.text = "This is HeaderView "
            return headerView
        } else{
            let footView : LearnCollectionFootView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footIdentifier, for: indexPath) as! LearnCollectionFootView
            footView.view.backgroundColor = .purple
            footView.label.text = "This is Foot"
            return footView
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section * 3 + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:LearnCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifier, for: indexPath) as! LearnCollectionViewCell
        cell.view.backgroundColor = armColor()
        cell.label.text = "This is cell - " + String(indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func armColor()->UIColor{
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
