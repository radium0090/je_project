//
//  WebViewController.swift
//  dkddm
//
//  Created by 皮皮 on 2019/03/28.
//  Copyright © 2019 SHI LEI. All rights reserved.
//

import UIKit

class WebViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var urlParam: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        URLCache.shared.removeAllCachedResponses()
        loadWebPage(urlParam ?? "https://japee.tokyo")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
