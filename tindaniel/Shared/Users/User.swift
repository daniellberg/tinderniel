//
//  User.swift
//  tindaniel
//
//  Created by Daniel Berg on 07/03/26.
//

import Foundation

struct User: Identifiable{
    let id: String
    let fullName: String
    var age: Int
    var profileImageURLs: [String]
}
