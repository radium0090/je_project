//
//  ViewController.swift
//  dkddm
//
//  Created by LEI SHI on 2019/01/04.
//  Copyright © 2019 SHI LEI. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    private var webView: WKWebView!
    var btnBack = UIBarButtonItem()
    var btnForward = UIBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setNavBar()
    }
    
    func loadWebPage(_ urlString: String) {
        // WKWebView生成
        let navHeight = self.navigationController?.navigationBar.frame.height
        let statusHeight = UIApplication.shared.statusBarFrame.height
        webView = WKWebView(frame:CGRect(x: 0, y: navHeight!+statusHeight, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        webView.navigationDelegate = self
        
        // URL設定
        let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
        let url = NSURL(string: encodedUrlString!)
        let request = NSURLRequest(url: url! as URL)
        webView.load(request as URLRequest)
        self.view.addSubview(webView)
    }
    
    @objc func setNavBar() {
        // set custom btn
        let button: UIButton = UIButton(type: .custom)
        // set image for btn
        button.setImage(UIImage(named: "scanner"), for: .normal)
        // add function for btn
        button.addTarget(self, action: #selector(ViewController.clickScan), for: .touchUpInside)
        // set btn frame
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.leftBarButtonItem = barButton
        // set right btn
        let refreshButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.refresh, target: self, action: #selector(ViewController.clickRefresh))
        refreshButton.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem = refreshButton
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "naviBarBg"), for: .default)
    }
    
    @objc func clickScan(){
        //searchButtonを押した際の処理を記述
        print("clickScan pressed.....")
        self.present(BarCodeViewController(), animated: true, completion: nil)
    }
    
    @objc func clickRefresh() {
        print("clickRefresh pressed.....")
        if webView.url != nil {
            webView.reload()
        } else {
            webView.load(URLRequest(url: URL(string: "https://japee.tokyo")!))
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: WKUIDelegate {
//  1
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if !(navigationAction.targetFrame?.isMainFrame != nil) {
            webView.load(navigationAction.request)
        }
        return nil
    }
    
//  2
    func webViewDidClose(_ webView: WKWebView) {
        
    }
        
//  3
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: () -> Void) {
        
    }
        
//  4
    func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: (Bool) -> Void) {
        
    }
        
//  5
    func webView(_ webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: (String?) -> Void) {
        
    }
}

extension ViewController: WKNavigationDelegate {
//  1
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        //必须调用回调
        decisionHandler(.allow)
    }
    
//  2
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        print("收到服务器的响应头")
        //必须调用回调
        decisionHandler(.allow)
    }
        
//  3
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            
    }
        
//  3.1
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            
    }
        
//  4
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
        
//  5
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.navigationItem.title = "JaPee"
    }
    
//  6
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        print("收到服务器重定向（Redirect）请求")
    }
        
//  7
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
    
//  8
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        print("SSL认证时调用")
        //必须调用
        completionHandler(.performDefaultHandling, nil)
    }
        
//  9
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        webView.reload()
    }
}
