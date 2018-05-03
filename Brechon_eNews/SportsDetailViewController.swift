//
//  SportsDetailViewController.swift
//  Brechon_eNews
//
//  Created by John on 4/29/18.
//  Copyright © 2018 John. All rights reserved.
//
import UIKit

class SportsDetailViewController: UIViewController {

            //Cell values
    @IBOutlet weak var sportsDetailImage: UIImageView!
    @IBOutlet weak var sportsDetailTitle: UILabel!
    @IBOutlet weak var sportsDetailAuthor: UILabel!
    @IBOutlet weak var sportsDetailDescription: UITextView!
    @IBOutlet weak var sportsDetailDate: UILabel!
    
    var stvImage:String!
    var stvTitle:String!
    var stvAuthor:String!
    var stvDescription:String!
    var stvDate:String!
    var stvWebSite:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

            //This formats the dVC screen
        sportsDetailDescription.layer.cornerRadius = 2
        sportsDetailImage.layer.cornerRadius = 2
        
            //Giving values to the dVC screen
        sportsDetailTitle.text = stvTitle
        sportsDetailAuthor.text = stvAuthor
        sportsDetailDescription.text = stvDescription
        sportsDetailDate.text = stvDate
        sportsDetailImage.imageFromServerURL(urlString: stvImage)
        
    }

    // MARK: - Navigation
    
    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            //This sends the URL value to the webView
        if(segue.identifier == "sportsWeb")
        {
            let destVC = segue.destination as! SportsWebSiteViewController
            
            destVC.sportsWebSite = stvWebSite
        }
    }
}
