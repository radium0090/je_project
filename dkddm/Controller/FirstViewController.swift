//
//  FirstViewController.swift
//  dkddm
//
//  Created by 是レイ on 2018/12/18.
//  Copyright © 2018年 SHI LEI. All rights reserved.
//

import UIKit

class FirstViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWebPage("https://japee.tokyo")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
