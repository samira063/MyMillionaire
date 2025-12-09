import SwiftUI

struct NewGameButton: View {
    var title: String = "New Game"
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                
                // Шестиугольная форма с ЖЁЛТЫМ градиентом
                LinearGradient(
                    colors: [
                        Color(hex: "FFE680"), // светло-жёлтый
                        Color(hex: "FFC300")  // насыщенный жёлтый
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .clipShape(ButtonShape())
                .shadow(color: .black.opacity(0.3), radius: 6, y: 4)
                .clipShape(ButtonShape())
                .glow(color: Color.yellow.opacity(0.9), radius: 20, intensity: 0.7)
                
                // Текст
                Text(title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                    .shadow(color: .black.opacity(0.3), radius: 1, y: 1)
            }
            .frame(height: 60)
            .padding(.horizontal, 40)
        }
    }
}
