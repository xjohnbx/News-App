//
//  ScienceWebViewController.swift
//  Brechon_eNews
//
//  Created by John on 4/29/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit
import WebKit

class ScienceWebViewController: UIViewController {

    @IBOutlet weak var scWebSite: WKWebView!
    
    var scvWebSite:String!
    
        //This loads the article website
    override func viewDidLoad() {
        super.viewDidLoad()

            //loading the URL
        let myURL = URL(string: scvWebSite)
        let urlRequest = URLRequest(url: myURL!)
        scWebSite.load(urlRequest)
    }

}
