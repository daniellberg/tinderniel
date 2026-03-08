//
//  CardService.swift
//  tindaniel
//
//  Created by Daniel Berg on 07/03/26.
//

import Foundation

//struct CardService {
//    func fetchCardModels() async throws -> [CardModel]{
//        return []
//    }
//}

struct CharacterResponse: Codable {
    let results: [Character]
}

struct Character: Codable {
    let name: String
    let image: String
}

class CardService {
    
    func fetchCardModels() async throws -> [CardModel] {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(CharacterResponse.self, from: data)
        
        var characters = decoded.results.shuffled()
        var cardModels: [CardModel] = []
        
        for character in decoded.results {
            // define quantas imagens este user vai ter
            let numberOfImages = Int.random(in: 1...7)
            
            // embaralha todo o array de personagens e pega 'numberOfImages' imagens
            let selectedImages = decoded.results.shuffled().prefix(numberOfImages).map { $0.image }
            
            let user = User(
                id: UUID().uuidString,
                fullName: character.name,
                age: Int.random(in: 18...80),
                profileImageURLs: selectedImages
            )
            
            cardModels.append(CardModel(user: user))
        }
        return cardModels
    }
}
