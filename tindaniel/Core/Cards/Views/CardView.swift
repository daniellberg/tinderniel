import SwiftUI

struct CardView: View {
    
    let user: User
    var onRemove: (() -> Void)? = nil
    
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    @State private var currentImageIndex = 0
    
    var body: some View {
        ZStack(alignment: .bottom){
            ZStack(alignment: .top){
                AsyncImage(url: URL(string: user.profileImageURLs[currentImageIndex])) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                        .overlay {
                            ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: user.profileImageURLs.count)
                        }
                } placeholder: {
                    ProgressView()
                        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                }
                
                CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: user.profileImageURLs.count)
                SwipeActionIndicatorView(xOffset: $xOffset)
            }
            
            UserInfoView(user: user)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
        .offset(x: xOffset)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
    }
}

private extension CardView {
    func returnCenter(){
        xOffset = 0
        degrees = 0
    }
    
    func swipeRight(){
        xOffset = 500
        degrees = 12
        onRemove?()
    }
    
    func swipeLeft(){
        xOffset = -500
        degrees = -12
        onRemove?()
    }
}

private extension CardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value){
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        if abs(width) <= abs(SizeConstants.screenCutOff) {
            returnCenter()
            return
        }
        if width >= SizeConstants.screenCutOff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}

#Preview {
    ZStack {
        ForEach(MockData.users) { user in
            CardView(user: user)
        }
    }
}
