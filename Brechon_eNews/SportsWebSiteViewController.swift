//
//  SportsWebSiteViewController.swift
//  Brechon_eNews
//
//  Created by John on 4/29/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit
import WebKit


class SportsWebSiteViewController: UIViewController {
    

    @IBOutlet weak var sWebSite: WKWebView!
    
    
    var sportsWebSite:String!
    
        //loading the article website
    override func viewDidLoad() {
        super.viewDidLoad()
        
            //Loading the URL
        let myURL = URL(string: sportsWebSite)
        let urlRequest = URLRequest(url: myURL!)
        sWebSite.load(urlRequest)
    }
}
