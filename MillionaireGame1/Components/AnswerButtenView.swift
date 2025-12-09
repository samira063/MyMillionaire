//import SwiftUI
//
//enum AnswerButtonState {
//    case normal
//    case correct
//    case wrong
//    case disabled
//}
//
//struct AnswerButtonView: View {
//    var letter: String
//    var text: String
//    var state: AnswerButtonState = .normal
//    var action: () -> Void
//
//    var body: some View {
//        Button(action: {
//            if state == .normal { action() }
//        }) {
//            ZStack {
//                // Внешний тёмно-синий шестигранник
//                HexagonShape()
//                    .fill(Color(hex: "0A2D59"))
//                    .frame(height: 62)
//                    .overlay(
//                        HexagonShape()
//                            .stroke(borderColor, lineWidth: 2)
//                    )
//                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
//
//                // Внутренний БЕЛЫЙ шестигранник
//                HexagonShape()
//                    .fill(innerBackgroundColor)
//                    .frame(height: 56)
//                    .padding(.horizontal, 4)
//                    .padding(.vertical, 3)
//
//                HStack(spacing: 10) {
//                    Text("\(letter):")
//                        .font(.system(size: 17, weight: .semibold))
//                        .foregroundColor(textColor)
//
//                    Text(text)
//                        .font(.system(size: 17, weight: .medium))
//                        .foregroundColor(textColor)
//                        .lineLimit(2)
//
//                    Spacer()
//                }
//                .padding(.horizontal, 24)
//            }
//        }
//        .disabled(state != .normal)
//    }
//
//    // MARK: - COLORS
//
//    private var innerBackgroundColor: Color {
//        switch state {
//        case .normal:
//            return .white
//        case .correct:
//            return Color(hex: "3CA600")
//        case .wrong:
//            return Color(hex: "C1432B")
//        case .disabled:
//            return Color.white.opacity(0.4)
//        }
//    }
//
//    private var borderColor: Color {
//        switch state {
//        case .normal:
//            return Color(hex: "0A2D59")
//        case .correct:
//            return Color.white
//        case .wrong:
//            return Color.white
//        case .disabled:
//            return Color(hex: "0A2D59").opacity(0.3)
//        }
//    }
//
//    private var textColor: Color {
//        switch state {
//        case .normal:
//            return Color.black
//        case .correct, .wrong:
//            return Color.white
//        case .disabled:
//            return Color.black.opacity(0.4)
//        }
//    }
//}
import SwiftUI

struct AnswerButtonView: View {
    let letter: String
    let text: String
    let state: AnswerButtonState
    let action: () -> Void

    var body: some View {
        Button(action: {
            if state == .normal { action() }
        }) {
            ZStack {
                // Hexagon-like look simplified with rounded rect + overlay to match style
                RoundedRectangle(cornerRadius: 12)
                    .fill(backgroundColor)
                    .frame(height: 62)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(borderColor, lineWidth: 3)
                    )
                    .shadow(color: Color.black.opacity(0.35), radius: 6, x: 0, y: 4)

                HStack(spacing: 12) {
                    Text("\(letter):")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(textColor)
                    Text(text)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(textColor)
                        .lineLimit(2)
                    Spacer()
                }
                .padding(.horizontal, 18)
            }
        }
        .disabled(state != .normal)
        .animation(.easeInOut(duration: 0.18), value: state)
    }

    private var backgroundColor: Color {
        switch state {
        case .normal:
            return Color(hex: "0A2D59").opacity(0.95)
        case .correct:
            return Color(hex: "3CA600").opacity(0.95)
        case .wrong:
            return Color(hex: "C1432B").opacity(0.95)
        case .disabled:
            return Color.black.opacity(0.25)
        }
    }

    private var borderColor: Color {
        switch state {
        case .normal:
            return Color.white.opacity(0.9)
        case .correct:
            return Color.white
        case .wrong:
            return Color.white
        case .disabled:
            return Color.white.opacity(0.4)
        }
    }

    private var textColor: Color {
        switch state {
        case .normal: return .white
        case .disabled: return .white.opacity(0.7)
        case .correct: return .white
        case .wrong: return .white
        }
    }
}
