//
//  DetailNewsViewController.swift
//  NewsApp
//
//  Created by Ivan Sebastian on 21/04/20.
//  Copyright © 2020 Vanski Corp. All rights reserved.
//

import UIKit
import WebKit

class DetailNewsViewController: UIViewController {

    var vw: WKWebView = WKWebView()
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let home = HomeViewContoller()
        let url_article = 
        webView.load(URLRequest(url: URL(string: "https://www.google.com")!))
       
    }


   
    
    
}
