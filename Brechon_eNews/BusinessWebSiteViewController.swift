//
//  WebSiteViewController.swift
//  Brechon_eNews
//
//  Created by John on 4/29/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit
import WebKit


class BusinessWebSiteViewController: UIViewController {

    @IBOutlet weak var webSite: WKWebView!
    
    var wvWebSite:String!
    
            //Loading the article website
    override func viewDidLoad() {
        super.viewDidLoad()

                //Loading the URL
        let myURL = URL(string: wvWebSite)
        let urlRequest = URLRequest(url: myURL!)
        webSite.load(urlRequest)
    }
}
