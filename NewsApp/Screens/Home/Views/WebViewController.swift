//
//  WebViewController.swift
//  NewsApp
//
//  Created by Ivan Sebastian on 21/04/20.
//  Copyright © 2020 Vanski Corp. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var url: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url  = URL(string: url){
            webView.loadRequest(URLRequest(url: url))
        }
        
    }
    

    

}
