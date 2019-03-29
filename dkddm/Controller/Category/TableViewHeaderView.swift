//
//  TableViewHeaderView.swift
//  dkddm
//
//  Created by 皮皮 on 2019/03/28.
//  Copyright © 2019 SHI LEI. All rights reserved.
//

import UIKit

class TableViewHeaderView: UIView {

    lazy var nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(222, 255, 240, 0.7)
        nameLabel.frame = CGRect(x: 15, y: 0, width: 200, height: 20)
        nameLabel.font = UIFont.systemFont(ofSize: 13)
        addSubview(nameLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
