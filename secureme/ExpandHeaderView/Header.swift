//
//  Header.swift
//  secureme
//
//  Created by Alex Chan on 4/23/18.
//  Copyright © 2018 secure.me. All rights reserved.
//

import Foundation

struct Header {
    var title: String!
    var elements: [String]!
    var expanded: Bool!
    
    init(title: String, elements: [String], expanded: Bool) {
        self.title = title
        self.elements = elements
        self.expanded = expanded
    }
}
