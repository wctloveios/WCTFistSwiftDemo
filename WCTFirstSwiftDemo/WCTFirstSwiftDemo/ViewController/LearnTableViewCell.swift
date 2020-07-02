//
//  LearnTableViewCell.swift
//  WCTFirstSwiftDemo
//
//  Created by wct on 2020/6/29.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class LearnTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.backgroundColor = .red
        
        let label = UILabel.init();
        label.frame = CGRect.init(x: 200, y: 0, width: 100, height: 20)
        label.text = "自定义cell"
        self.addSubview(label)
        
        let button = UIButton.init(type: .system)
        button.frame = CGRect.init(x: 300, y: 0, width: 20, height: 20)
        button.backgroundColor = .green
        self.addSubview(button)
        button.addTarget(self, action: #selector(didClickBtn), for: .touchUpInside)
    }
    
    @objc func didClickBtn () {
//        LearnUITableViewViewController().didClickButton
        print("cell 上按钮点击")
    }
}
