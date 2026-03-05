//
//  ImageScrollingOverlay.swift
//  tindaniel
//
//  Created by Daniel Berg on 04/03/26.
//

import SwiftUI

struct ImageScrollingOverlay: View {
    @Binding var currentImageIndex: Int
    
    let imageCount: Int
    
    var body: some View {
        HStack(){
            Rectangle() //left side rectangle
                .onTapGesture {
                    updateImageIndex(increment: false)
                }
            
            Rectangle()
                .onTapGesture {
                    updateImageIndex(increment: true)
                }
        }
        .foregroundStyle(.white.opacity(0.01))
    }
}

private extension ImageScrollingOverlay {
    func updateImageIndex(increment: Bool){
        if increment{
            guard currentImageIndex < imageCount - 1 else {return}
            currentImageIndex += 1
        } else{
            guard currentImageIndex > 0 else {return}
            currentImageIndex -= 1
        }
    }
}

#Preview {
    ImageScrollingOverlay(currentImageIndex: .constant(1), imageCount: 2)
}
