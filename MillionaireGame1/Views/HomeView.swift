
import SwiftUI

struct HomeView: View {
    @State private var animate = false
    @State private var showRules = false
    @State private var startGame = false

    var body: some View {
        NavigationView {
            ZStack {
                // Background gradient
                LinearGradient(
                    colors: [
                        Color(hex: "001F60"),
                        Color(hex: "003A8D"),
                        Color(hex: "001F60")
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                .onAppear { animate = true }

                VStack(spacing: 24) {

                    // Logo
                    Image("MillionaireLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                        .opacity(animate ? 1 : 0)
                        .offset(y: animate ? 0 : -20)
                        .animation(.easeOut(duration: 0.8), value: animate)

                    // Main title
                    Text("Who Wants\n to be a Millionaire")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .opacity(animate ? 1 : 0)
                        .offset(y: animate ? 0 : -15)
                        .animation(.easeOut(duration: 0.9).delay(0.1), value: animate)

                    // Best Score example
                    BestScoreView(score: 12000)
                        .opacity(animate ? 1 : 0)
                        .offset(y: animate ? 0 : 20)
                        .animation(.easeOut(duration: 1.2).delay(0.4), value: animate)

                    // Continue button
                    ContinueButton {
                        print("CONTINUE tapped")
                    }
                    .opacity(animate ? 1 : 0)
                    .offset(y: animate ? 0 : 20)
                    .animation(.easeOut(duration: 1.0).delay(0.2), value: animate)

                    // New Game button → now opens GameView
                    NavigationLink(destination: GameView(), isActive: $startGame) {
                        EmptyView()
                    }

                    NewGameButton(title: "New Game") {
                        startGame = true
                    }
                    .opacity(animate ? 1 : 0)
                    .offset(y: animate ? 0 : 20)
                    .animation(.easeOut(duration: 1.1).delay(0.3), value: animate)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { showRules = true } label: {
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 30, height: 30)
                            Image(systemName: "questionmark")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .sheet(isPresented: $showRules) {
                RulesView()
            }
        }
    }
}

#Preview {
    HomeView()
}
