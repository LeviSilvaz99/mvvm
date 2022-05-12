//
//  User.swift
//  mvvm
//
//  Created by André Levi Oliveira Silva on 11/05/22.
//

import Foundation

struct Contact: Codable {
    let id, name, email: String
}

struct Welcome: Codable {
    let contacts: [Contact]
}


