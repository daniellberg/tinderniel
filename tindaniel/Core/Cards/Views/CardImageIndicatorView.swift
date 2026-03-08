//
//  CardImageIndicatorView.swift
//  tindaniel
//
//  Created by Daniel Berg on 07/03/26.
//

import SwiftUI

struct CardImageIndicatorView: View {
    
    let currentImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        HStack {
            ForEach(0 ..< imageCount,id: \.self){ index in
                Capsule()
                    .frame(width: imageIndicatorWidth, height: 5)
                    .foregroundStyle(currentImageIndex == index ? .white : .gray)
                    .padding(.top,8)
            }
        }
    }
}

private extension CardImageIndicatorView{
    var imageIndicatorWidth: CGFloat {
        return SizeConstants.cardWidth / CGFloat(imageCount)-28
    }
}

#Preview {
    CardImageIndicatorView(currentImageIndex: 1, imageCount: 3)
        .preferredColorScheme(.dark)
}
