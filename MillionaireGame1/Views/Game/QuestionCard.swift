import SwiftUI

struct QuestionCard: View {
    let number: Int
    let price: Int
    let text: String

    var body: some View {
        VStack(spacing: 12) {
            Text("QUESTION #\(number)")
                .foregroundColor(.white.opacity(0.7))
                .font(.headline)

            Text("$\(price)")
                .font(.title.bold())
                .foregroundColor(.yellow)

            Text(text)
                .font(.title3.bold())
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.15))
        )
    }
}
