//
//  CardsViewModel.swift
//  tindaniel
//
//  Created by Daniel Berg on 07/03/26.
//

import Foundation

class CardsViewModel: ObservableObject {
    @Published var cardModels = [CardModel]()
    
    private let service: CardService
    init(service: CardService){
        self.service = service
    }
    
    func fetchCardModel() async{
        do {
            self.cardModels = try await service.fetchCardModels()
        } catch {
            print("DEBUG: Failed to fetch cards with error: \(error)")
        }
        
    }
}

