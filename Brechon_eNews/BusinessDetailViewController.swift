//
//  BusinessDetailViewController.swift
//  Brechon_eNews
//
//  Created by John on 4/29/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit

class BusinessDetailViewController: UIViewController {

        //Cell values
    @IBOutlet weak var businessDetailImage: UIImageView!
    @IBOutlet weak var businessDetailTitle: UILabel!
    @IBOutlet weak var businessDetailAuthor: UILabel!
    @IBOutlet weak var businessDetailDescription: UITextView!
    @IBOutlet weak var businessDetailDate: UILabel!
    @IBOutlet weak var businessDetailWebsite: UIButton!
    
    var btvImage:String!
    var btvTitle:String!
    var btvAuthor:String!
    var btvDescription:String!
    var btvDate:String!
    var btvWebSite:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

            //This is formatting the dVC
        businessDetailDescription.layer.cornerRadius = 2
        businessDetailImage.layer.cornerRadius = 2
        
            //This gives values to the DVC
        businessDetailTitle.text = btvTitle
        businessDetailAuthor.text = btvAuthor
        businessDetailDescription.text = btvDescription
        businessDetailDate.text = btvDate
        businessDetailImage.imageFromServerURL(urlString: btvImage)
        
        
    }
    
    // MARK: - Navigation

    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
            //Sending the URL value to the webView
        if(segue.identifier == "businessWeb")
        {
            let destVC = segue.destination as! BusinessWebSiteViewController
            
            destVC.wvWebSite = btvWebSite
        }
    }
    

}
