//
//  MockData.swift
//  tindaniel
//
//  Created by Daniel Berg on 07/03/26.
//

//import Foundation
//
//struct MockData {
//    static let users: [User] = (1...20).map { index in
//        User(
//            id: UUID().uuidString,
//            fullName: (index),
//            age: <#T##Int#>,
//            profileImageURLs: <#T##[String]#>
//        )
//}

import Foundation

struct MockData {
    static let users: [User] = [
        .init(
            id: UUID().uuidString,
            fullName: "Rick Sanchez",
            age: 70,
            profileImageURLs: ["https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                              "https://rickandmortyapi.com/api/character/avatar/3.jpeg"]
        ),
        .init(
            id: UUID().uuidString,
            fullName: "Morty Smith",
            age: 14,
            profileImageURLs: ["https://rickandmortyapi.com/api/character/avatar/2.jpeg",
                              "https://rickandmortyapi.com/api/character/avatar/3.jpeg"]
        )
    ]
}
