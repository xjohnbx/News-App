//
//  SportsTableViewCell.swift
//  Brechon_eNews
//
//  Created by John on 4/29/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit

class SportsTableViewCell: UITableViewCell {

        //Cell fields
    @IBOutlet weak var sportsImage: UIImageView!
    @IBOutlet weak var sportsTitle: UILabel!
    @IBOutlet weak var sportsSource: UILabel!
    @IBOutlet weak var sportsDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
