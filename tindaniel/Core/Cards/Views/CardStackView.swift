//
//  CardStackView.swift
//  tindaniel
//
//  Created by Daniel Berg on 07/03/26.
//

import SwiftUI

struct CardStackView: View {
    
    @StateObject var viewModel = CardsViewModel(service: CardService())

    
    var body: some View {
        ZStack{
            ForEach(Array(viewModel.cardModels.enumerated()), id: \.element.id){ index, card in
                CardView(user: card.user){
                    viewModel.cardModels.remove(at: index)
                }
                
            }
        }
        .task {
            await viewModel.fetchCardModel()
        }
    }
}

#Preview {
    CardStackView()
}
