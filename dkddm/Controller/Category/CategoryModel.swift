//
//  CategoryModel.swift
//  dkddm
//
//  Created by 皮皮 on 2019/03/28.
//  Copyright © 2019 SHI LEI. All rights reserved.
//

import UIKit

class CategoryModel: NSObject {
    var name : String?
    var icon : String?
    var spus : [FoodModel]?
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "spus" {
            spus = Array()
            guard let datas = value as? [[String : Any]] else { return }
            for dict in datas {
                let foodModel = FoodModel(dict: dict)
                spus?.append(foodModel)
            }
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}

class FoodModel: NSObject {
    
    var name : String?
    var picture : String?
    var minPrice : Float?
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "min_price" {
            guard let price = value as? Float else {return}
            minPrice = price
        } else {
            super.setValue(value, forKey: key)
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}

