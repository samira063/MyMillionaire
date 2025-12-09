import SwiftUI

struct GameWrongView: View {
    var correctAnswerText: String? = nil
    var restartAction: () -> Void

    @State private var shake = false
    

    var body: some View {
        ZStack {
            Color.black.opacity(0.6).ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer()

                VStack(spacing: 10) {
                    Text("Wrong")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(.white)

                    if let correct = correctAnswerText {
                        Text("Correct answer:\n\(correct)")
                            .font(.title3)
                            .foregroundColor(.yellow)
                            .multilineTextAlignment(.center)
                            .padding(.top, 6)
                    }
                }
                .padding(28)
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .fill(Color(hex: "140E1F"))
                        .shadow(color: Color.black.opacity(0.6), radius: 10, x: 0, y: 6)
                )
                .offset(x: shake ? -8 : 0)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.08).repeatCount(6, autoreverses: true)) {
                        shake = true
                    }
                }

                Spacer()

                Button(action: {
                    restartAction()
                }) {
                    Text("Restart")
                        .font(.system(size: 18, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 14).fill(Color.red))
                        .foregroundColor(.white)
                        .padding(.horizontal, 40)
                }
                .padding(.bottom, 40)
            }
            .padding()
        }
    }
}
