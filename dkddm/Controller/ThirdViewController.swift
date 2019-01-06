//
//  ThirdViewController.swift
//  dkddm
//
//  Created by 是レイ on 2018/12/18.
//  Copyright © 2018年 SHI LEI. All rights reserved.
//

import UIKit

class ThirdViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        URLCache.shared.removeAllCachedResponses()
        loadWebPage("https://japee.tokyo/my-account/")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
