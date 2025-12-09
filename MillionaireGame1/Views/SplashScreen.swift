import SwiftUI

struct SplashScreen: View {
    @State private var logoScale: CGFloat = 0.6
    @State private var glowOpacity: Double = 0.0
    @State private var ringScale: CGFloat = 0.8
    @State private var particles = [Particle]()

    var body: some View {
        ZStack {
            // Глубокий космический фон
            LinearGradient(
                colors: [
                    Color(hex: "03071E"),
                    Color(hex: "0A0F2A"),
                    Color(hex: "1A237E")
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            // Частицы
            ZStack {
                ForEach(particles) { particle in
                    Circle()
                        .fill(Color.white.opacity(particle.opacity))
                        .frame(width: particle.size, height: particle.size)
                        .position(x: particle.x, y: particle.y)
                        .blur(radius: particle.blur)
                }
            }

            // Логотип + эффекты
            ZStack {

                // Неоновое кольцо
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [Color.white.opacity(0.9), Color.white.opacity(0.1)],
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 4
                    )
                    .frame(width: 250, height: 250)
                    .scaleEffect(ringScale)
                    .blur(radius: 2)
                    .shadow(color: .white.opacity(0.6), radius: 12)
                    .animation(.easeInOut(duration: 1.8).repeatForever(autoreverses: true), value: ringScale)

                // Сияние
                Circle()
                    .fill(Color.white.opacity(glowOpacity))
                    .frame(width: 240, height: 240)
                    .blur(radius: 35)

                // Логотип
                Image("MillionaireLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 330)
                    .shadow(color: .white.opacity(0.7), radius: 12)
            }
            .scaleEffect(logoScale)
            .onAppear {
                startAnimations()
            }
        }
        .onAppear {
            generateParticles()
        }
    }

    // MARK: - Animations

    private func startAnimations() {
        withAnimation(.easeOut(duration: 1.2)) {
            logoScale = 1.05
            glowOpacity = 0.45
        }

        withAnimation(.easeInOut(duration: 1.4).repeatForever(autoreverses: true)) {
            glowOpacity = 0.20
        }

        withAnimation(.easeInOut(duration: 2.0).repeatForever()) {
            ringScale = 1.05
        }

        withAnimation(.easeOut(duration: 1.05).delay(0.4)) {
            logoScale = 1.0
        }
    }

    // MARK: - Particles

    private func generateParticles() {
        particles = (0..<25).map { _ in
            Particle()
        }

        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            for i in particles.indices {
                particles[i].update()
            }
        }
    }
}

// MARK: - Particle Model

struct Particle: Identifiable {
    let id = UUID()
    var x: CGFloat = CGFloat.random(in: 50...350)
    var y: CGFloat = CGFloat.random(in: 700...900)
    var size: CGFloat = CGFloat.random(in: 2...5)
    var opacity: Double = Double.random(in: 0.1...0.4)
    var speed: CGFloat = CGFloat.random(in: 0.4...1)
    var blur: CGFloat = CGFloat.random(in: 0...2)

    mutating func update() {
        y -= speed
        if y < -10 {
            y = CGFloat.random(in: 700...900)
        }
    }
}
#Preview {
    SplashScreen()
}
