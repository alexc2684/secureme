//
//  User.swift
//  secureme
//
//  Created by Alex Chan on 4/23/18.
//  Copyright © 2018 secure.me. All rights reserved.
//

import Foundation

struct User {
    var username: String!
    var password: String!
    var email: String!
    var phone: String!
    var selections: [String: Bool]
    
    init(username: String, password: String, email: String, phone: String, selections: [String: Bool]) {
        self.username = username
        self.password = password
        self.email = email
        self.phone = phone
        self.selections = selections
    }
}
