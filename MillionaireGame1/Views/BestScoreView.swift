import SwiftUI

struct BestScoreView: View {
    var score: Int = 0

    var body: some View {
        ZStack {
            // Фон блока
            LinearGradient(
                colors: [
                    Color(hex: "0A1A4B"),
                    Color(hex: "112D7A")
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white.opacity(0.3), lineWidth: 2)
            )
            .shadow(color: .black.opacity(0.4), radius: 6, y: 4)

            VStack(spacing: 6) {
                Text("Best Score")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color.white.opacity(0.9))

                Text("\(score)")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.yellow)
            }
        }
        .frame(height: 100)
        .padding(.horizontal, 40)
    }
}
