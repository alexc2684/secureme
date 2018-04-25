 //
//  SelectionTableViewCell.swift
//  secureme
//
//  Created by Alex Chan on 4/25/18.
//  Copyright © 2018 secure.me. All rights reserved.
//

import UIKit

class SelectionTableViewCell: UITableViewCell {
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var iconLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
