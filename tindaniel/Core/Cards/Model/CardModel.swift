//
//  CardModel.swift
//  tindaniel
//
//  Created by Daniel Berg on 07/03/26.
//

import Foundation

struct CardModel {
    let user: User
}

extension CardModel: Identifiable{
    var id: String {return user.id}
}
