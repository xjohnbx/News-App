//
//  ScienceTableViewCell.swift
//  Brechon_eNews
//
//  Created by John on 4/29/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit

class ScienceTableViewCell: UITableViewCell {

        //Cell fields
    @IBOutlet weak var scienceImage: UIImageView!
    @IBOutlet weak var scienceTitle: UILabel!
    @IBOutlet weak var scienceSource: UILabel!
    @IBOutlet weak var scienceDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
