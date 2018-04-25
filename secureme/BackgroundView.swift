//
//  BackgroundView.swift
//  secureme
//
//  Created by Alex Chan on 4/25/18.
//  Copyright © 2018 secure.me. All rights reserved.
//

import UIKit

class BackgroundView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    self.view.sendSubview(toBack: BackgroundView)
}
