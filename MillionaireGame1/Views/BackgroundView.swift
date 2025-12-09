import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 0.02, green: 0.08, blue: 0.23),
                Color(red: 0.00, green: 0.18, blue: 0.45)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}
#Preview {
    BackgroundView()
}
