import SwiftUI

struct MillionaireButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                LinearGradient(
                    colors: [
                        Color(hex: "F9D423"),
                        Color(hex: "FF4E50")
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .clipShape(ButtonShape())

                Text(title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
            }
            .frame(height: 60)
            .padding(.horizontal, 40)
        }
    }
}
