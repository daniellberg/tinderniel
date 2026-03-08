//
//  CharacterService.swift
//  tindaniel
//
//  Created by Daniel Berg on 07/03/26.
//

//import Foundation
//
//struct CharacterResponse: Codable {
//    let results: [Character]
//}
//
//struct Character: Codable {
//    let name: String
//    let image: String
//}
//
//class CharacterService {
//    
//    func fetchCharacters() async throws -> [User] {
//        let url = URL(string: "https://rickandmortyapi.com/api/character")!
//        
//        let (data, _) = try await URLSession.shared.data(from: url)
//        
//        let decoded = try JSONDecoder().decode(CharacterResponse.self, from: data)
//        
//        return decoded.results.map { character in
//            User(
//                id: UUID().uuidString,
//                fullName: character.name,
//                age: Int.random(in: 18...80),
//                profileImageURLs: [character.image]
//            )
//        }
//    }
//}
