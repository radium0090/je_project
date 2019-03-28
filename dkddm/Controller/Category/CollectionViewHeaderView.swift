//
//  CollectionViewHeaderView.swift
//  dkddm
//
//  Created by 皮皮 on 2019/03/28.
//  Copyright © 2019 SHI LEI. All rights reserved.
//

import UIKit

class CollectionViewHeaderView: UICollectionReusableView {
        
    private lazy var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(240, 240, 240, 0.8)
        
        titleLabel.frame = CGRect(x: 0, y: 5, width: ScreenWidth - 80, height: 20)
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
    }
    
    func setDatas(_ model : CollectionCategoryModel) {
        
        guard let name = model.name else { return }
        
        titleLabel.text = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

