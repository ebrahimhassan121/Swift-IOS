//
//  mycell.swift
//  ZooAPP
//
//  Created by ebrahim hassan on 8/22/17.
//  Copyright © 2017 ebrahim hassan. All rights reserved.
//

import UIKit

class mycell: UITableViewCell {

    @IBOutlet weak var LaImage: UIImageView!
    @IBOutlet weak var LaName: UILabel!
    @IBOutlet weak var LaDes: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
