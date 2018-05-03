//
//  ScienceDetailViewController.swift
//  Brechon_eNews
//
//  Created by John on 4/29/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit

class ScienceDetailViewController: UIViewController {

        //Cell details
    @IBOutlet weak var scienceDetailImage: UIImageView!
    @IBOutlet weak var scienceDetailTitle: UILabel!
    @IBOutlet weak var scienceDetailAuthor: UILabel!
    @IBOutlet weak var scienceDetailDescription: UITextView!
    @IBOutlet weak var scienceDetailDate: UILabel!
    
    var sctvImage:String!
    var sctvTitle:String!
    var sctvAuthor:String!
    var sctvDescription:String!
    var sctvDate:String!
    var sctvWebSite:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

            //Formatting the detail screen
        scienceDetailDescription.layer.cornerRadius = 2
        scienceDetailImage.layer.cornerRadius = 2
        
            //Giving the fields on the dVC values
        scienceDetailTitle.text = sctvTitle
        scienceDetailAuthor.text = sctvAuthor
        scienceDetailDescription.text = sctvDescription
        scienceDetailDate.text = sctvDate
        scienceDetailImage.imageFromServerURL(urlString: sctvImage)
        
    }

    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            //This sends the website URL to the webView
        if(segue.identifier == "scienceWeb")
        {
            let destVC = segue.destination as! ScienceWebViewController
            
            destVC.scvWebSite = sctvWebSite
        }
    }
 

}
