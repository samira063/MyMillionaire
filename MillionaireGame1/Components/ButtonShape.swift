import SwiftUI

struct ButtonShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let edge: CGFloat = 20

        path.move(to: CGPoint(x: edge, y: 0))
        path.addLine(to: CGPoint(x: rect.width - edge, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height / 2))
        path.addLine(to: CGPoint(x: rect.width - edge, y: rect.height))
        path.addLine(to: CGPoint(x: edge, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height / 2))
        path.closeSubpath()

        return path
    }
}
#Preview {
    ButtonShape()
}
