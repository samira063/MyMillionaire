//import SwiftUI
//
//struct HexagonShape: Shape {
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        let inset = rect.height * 0.18
//
//        path.move(to: CGPoint(x: inset, y: 0))
//        path.addLine(to: CGPoint(x: rect.width - inset, y: 0))
//        path.addLine(to: CGPoint(x: rect.width, y: rect.height / 2))
//        path.addLine(to: CGPoint(x: rect.width - inset, y: rect.height))
//        path.addLine(to: CGPoint(x: inset, y: rect.height))
//        path.addLine(to: CGPoint(x: 0, y: rect.height / 2))
//        path.closeSubpath()
//
//        return path
//    }
//}
import SwiftUI

struct HexagonShape: Shape {
    func path(in rect: CGRect) -> Path {
        let w = rect.width
        let h = rect.height
        let dx = w * 0.20
        var p = Path()
        p.move(to: CGPoint(x: dx, y: 0))
        p.addLine(to: CGPoint(x: w - dx, y: 0))
        p.addLine(to: CGPoint(x: w, y: h/2))
        p.addLine(to: CGPoint(x: w - dx, y: h))
        p.addLine(to: CGPoint(x: dx, y: h))
        p.addLine(to: CGPoint(x: 0, y: h/2))
        p.closeSubpath()
        return p
    }
}
