import SwiftUI

struct ShineOverlay: View {
    @State private var move = false
    
    var body: some View {
        LinearGradient(
            colors: [
                Color.white.opacity(0.0),
                Color.white.opacity(0.3),
                Color.white.opacity(0.0)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        .frame(width: 60)
        .rotationEffect(.degrees(45))
        .offset(x: move ? 300 : -300)
        .animation(.linear(duration: 1.8).repeatForever(autoreverses: false), value: move)
        .onAppear {
            move = true
        }
    }
}
