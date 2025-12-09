import SwiftUI

struct Glow: ViewModifier {
    var color: Color = .white
    var radius: CGFloat = 15
    var intensity: CGFloat = 0.6

    func body(content: Content) -> some View {
        content
            .shadow(color: color.opacity(intensity), radius: radius)
            .shadow(color: color.opacity(intensity * 0.7), radius: radius / 2)
            .shadow(color: color.opacity(intensity * 0.4), radius: radius / 4)
    }
}

extension View {
    func glow(color: Color = .white, radius: CGFloat = 15, intensity: CGFloat = 0.7) -> some View {
        modifier(Glow(color: color, radius: radius, intensity: intensity))
    }
}
