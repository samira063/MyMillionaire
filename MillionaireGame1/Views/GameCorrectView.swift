import SwiftUI

struct GameCorrectView: View {
    var earned: Int? = nil
    var nextAction: () -> Void

    @State private var showConfetti = false

    var body: some View {
        ZStack {
            // полупрозрачный фон
            Color.black.opacity(0.6).ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer()

                VStack(spacing: 12) {
                    Text("Correct!")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)

                    if let earned = earned {
                        Text("You win $\(earned)")
                            .font(.title2.bold())
                            .foregroundColor(.yellow)
                    }
                }
                .padding(30)
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color(hex: "082042"))
                        .shadow(color: Color.black.opacity(0.6), radius: 10, x: 0, y: 6)
                )
                .scaleEffect(showConfetti ? 1.06 : 1.0)
                .onAppear {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
                        showConfetti = true
                    }
                }

                Spacer()

                Button(action: {
                    nextAction()
                }) {
                    Text("Next")
                        .font(.system(size: 18, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 14).fill(Color.yellow))
                        .foregroundColor(.black)
                        .padding(.horizontal, 40)
                }
                .padding(.bottom, 40)
            }
            .padding()
        }
    }
}
