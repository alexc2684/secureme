//
//  ExpandHeaderView.swift
//  secureme
//
//  Created by Alex Chan on 4/23/18.
//  Copyright © 2018 secure.me. All rights reserved.
//

import UIKit

protocol ExpandHeaderViewDelegate {
    func toggleSection(header: ExpandHeaderView, section: Int)
}

class ExpandHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var titleLabel: UILabel!
    
    var delegate: ExpandHeaderViewDelegate?
    var section: Int!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (selectHeaderView)))
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
