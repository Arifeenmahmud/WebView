//
//  ViewController.swift
//  webView
//
//  Created by Arifeen Mahmud on 4/1/20.
//  Copyright © 2020 Arifeen Mahmud. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    
   @IBOutlet weak var activity: UIActivityIndicatorView!
   
    
    var webView: WKWebView!
    var progressView: UIProgressView!
    let website = "www.bangladesh.gov.bd"
    
    //Equivalent of webViewDidStartLoad:
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("didStartProvisionalNavigation - webView.url: \(String(describing: webView.url?.description))")
    }
    
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(handleHome))
        setUpViewController()
        
        
    }
    
    
    func setUpViewController(){
        
        let url = URL(string: "https://\(website)")!
        webView.load(URLRequest(url: url))
    }
    
    @objc func handleHome() {
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
        
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction) {
        guard let actionTitle = action.title else { return }
        guard let url = URL(string: "https://" + actionTitle) else { return }
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    

    
    
}

