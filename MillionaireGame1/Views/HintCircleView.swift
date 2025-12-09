import SwiftUI

struct HintCircleView: View {
    let icon: String

    var body: some View {
        Circle()
            .fill(Color.white.opacity(0.06))
            .frame(width: 72, height: 72)
            .overlay(
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .font(.title)
            )
    }
}
