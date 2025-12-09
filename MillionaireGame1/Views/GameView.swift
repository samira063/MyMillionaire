import SwiftUI

struct GameView: View {
    @StateObject private var vm = GameViewModel()
    @State private var showLevels = false
    
    private let letters = ["A","B","C","D"]

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(hex: "001A45"), Color(hex: "003A8D")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 18) {

                // MARK: — TOP BAR WITH LEVELS BUTTON
                HStack {
                    Spacer()

                    Button(action: {
                        showLevels = true
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.white.opacity(0.10))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)

                // MARK: — QUESTION NUMBER
                Text("QUESTION #\(vm.currentIndex + 1)")
                    .foregroundColor(.white.opacity(0.7))
                    .font(.subheadline)

                // MARK: — PRICE
                Group {
                    if let q = vm.currentQuestion {
                        Text("$\(q.price ?? 0)")
                            .foregroundColor(.yellow)
                            .font(.title.bold())
                    } else {
                        Text("$0")
                            .foregroundColor(.yellow)
                            .font(.title.bold())
                    }
                }

                // MARK: — QUESTION TEXT
                Text(vm.currentQuestion?.text ?? "Loading...")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Spacer().frame(height: 4)

                // MARK: — ANSWERS
                VStack(spacing: 14) {
                    ForEach(0..<4) { i in
                        AnswerButtonView(
                            letter: letters[i],
                            text: vm.currentQuestion?.options[safe: i] ?? "",
                            state: vm.buttonState(for: i)
                        ) {
                            vm.selectAnswer(i)
                        }
                    }
                }
                .padding(.horizontal, 32)

                Spacer()

                // MARK: — HINTS BOTTOM
                HStack(spacing: 26) {
                    HintCircleView(icon: "50")
                    HintCircleView(icon: "person.3.fill")
                    HintCircleView(icon: "phone.fill")
                }
                .padding(.bottom, 24)
            }
        }
        .sheet(isPresented: $showLevels) {
            LevelsView(currentLevel: vm.currentIndex)
        }
        .onAppear {
            vm.startNewGame()
        }
    }
}
#Preview {
    GameView()
}
