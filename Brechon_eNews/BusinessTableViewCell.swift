//
//  TableViewCell.swift
//  Brechon_eNews
//
//  Created by John on 4/29/18.
//  Copyright © 2018 John. All rights reserved.
//

import UIKit

class BusinessTableViewCell: UITableViewCell {

        //Cell fields
    @IBOutlet weak var businessImageView: UIImageView!
    @IBOutlet weak var businessTitleLabel: UILabel!
    @IBOutlet weak var businessSourceLabel: UILabel!
    @IBOutlet weak var businessDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
