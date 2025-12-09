import SwiftUI

struct HexagonButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(.white)
            .padding(.vertical, 22)
            .frame(width: 260)
            .background(
                HexagonShape()
                    .fill(Color(hex: "0A84FF"))
            )
            .overlay(
                HexagonShape()
                    .stroke(Color.white.opacity(0.9), lineWidth: 3)
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .shadow(radius: 12)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}

