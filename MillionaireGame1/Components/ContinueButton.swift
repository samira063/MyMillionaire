import SwiftUI

struct ContinueButton: View {
    var title: String = "Continue Game"
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                
                // Шестиугольная форма с градиентом
                LinearGradient(
                    colors: [
                        Color(hex: "3751FF"), // светло-синий
                        Color(hex: "192BC2")  // тёмно-синий
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .clipShape(ButtonShape())
                .shadow(color: .black.opacity(0.3), radius: 6, y: 4)
                
                .clipShape(ButtonShape())
                .glow(color: Color.white.opacity(0.9), radius: 20, intensity: 0.7)
                
                // Текст
                Text(title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.4), radius: 2, y: 1)
            }
            .frame(height: 60)
            .padding(.horizontal, 40)
        }
    }
}
