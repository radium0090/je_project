//
//  CollectionCategoryModel.swift
//  dkddm
//
//  Created by 皮皮 on 2019/03/28.
//  Copyright © 2019 SHI LEI. All rights reserved.
//

import UIKit
import Foundation

class CollectionCategoryModel: NSObject {
    
    var name : String?
    var subcategories : [SubCategoryModel]?
    
    init(dict : [String : Any]) {
        super.init()
//        self.setValuesForKeys(dict)
        self.name = dict["name"] as? String
        
        if let sub = dict["subcategories"] as? [[String : Any]] {
            self.subcategories = sub.map {
                SubCategoryModel(dict: $0)
            }
        }
//        self.subcategories = dict["subcategories"] as? [SubCategoryModel]
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        
        if key == "subcategories" {
            subcategories = Array()
            guard let datas = value as? [[String : Any]] else { return }
            for dict in datas {
                let subModel = SubCategoryModel(dict: dict)
                subcategories?.append(subModel)
            }
        } else {
            super.setValue(value, forKey: key)
        }
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}

class SubCategoryModel: NSObject {
    
    var iconUrl : String?
    var name : String?
    var url : String?
    var img : String?
    
    init(dict : [String : Any]) {
        super.init()
        self.iconUrl = dict["icon_url"] as? String
        self.name = dict["name"] as? String
        self.url = dict["url"] as? String
        self.img = dict["img"] as? String
//        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "icon_url" {
            guard let icon = value as? String else { return }
            iconUrl = icon
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}

