import Foundation
import SwiftUI
import Combine

// MARK: - Models & Enums

//struct Question: Identifiable, Codable {
//    let id: Int
//    let text: String
//    let options: [String]
//    let correctIndex: Int
//    let price: Int?
//}

enum AnswerButtonState {
    case normal
    case correct
    case wrong
    case disabled
}

enum AnswerResult {
    case none
    case correct
    case wrong
}

@MainActor
final class GameViewModel: ObservableObject {
    // questions loaded from Questions.json if exists
    @Published private(set) var questions: [Question] = []
    @Published var currentIndex: Int = 0
    @Published var timerValue: Int = 30
    @Published var buttonStates: [AnswerButtonState] = [.normal, .normal, .normal, .normal]
    @Published var disabledAnswers: Set<Int> = []
    @Published var answerResult: AnswerResult = .none

    // UI control
    @Published var showLevels: Bool = false
    let moneyLevels: [Int] = [
        100, 200, 300, 500,
        1000, 2000, 4000, 8000,
        16000, 32000, 64000, 125000,
        250000, 500000, 1000000
    ]

    private var timer: Timer?
    private var cancellables = Set<AnyCancellable>()

    init() {
        loadQuestions()
        Task { @MainActor in
            resetForCurrentQuestion()
        }
    }

    deinit {
        Task { @MainActor in
            stopTimer()
        }
    }


    var currentQuestion: Question? {
        guard questions.indices.contains(currentIndex) else { return nil }
        return questions[currentIndex]
    }

    // MARK: - Loading

    func loadQuestions() {
        print("🔍 Ищу файл questions.json в Bundle…")

        guard let url = Bundle.main.url(forResource: "questions", withExtension: "json") else {
            print("❌ Файл questions.json не найден в Bundle!")
            loadFallbackQuestions()
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode([Question].self, from: data)

            if decoded.isEmpty {
                print("❌ JSON пустой!")
                loadFallbackQuestions()
            } else {
                print("✅ Загружено \(decoded.count) вопросов из JSON.")
                questions = decoded
            }

        } catch {
            print("❌ Ошибка декодирования JSON:", error)
            loadFallbackQuestions()
        }

        currentIndex = 0
        resetForCurrentQuestion()
    }

    private func loadFallbackQuestions() {
        questions = [
            Question(id: 1, text: "Fallback Q1", options: ["A","B","C","D"], correctIndex: 0, price: 100)
        ]
    }

    // MARK: - Game control

    func startNewGame() {
        currentIndex = 0
        answerResult = .none
        resetForCurrentQuestion()
    }

    func goToNextQuestion() {
        answerResult = .none
        currentIndex += 1
        if currentIndex >= questions.count {
            // reached end — restart for demo or keep last behaviour
            currentIndex = 0
        }
        resetForCurrentQuestion()
    }

    private func resetForCurrentQuestion() {
        stopTimer()
        timerValue = 30
        buttonStates = [.normal, .normal, .normal, .normal]
        disabledAnswers = []
        answerResult = .none
        startTimer()
    }

    // MARK: - Timer
    @MainActor
    private func startTimer() {
        stopTimer()
        timerValue = 30

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] t in
            guard let self = self else { t.invalidate(); return }

            if self.timerValue > 0 {
                self.timerValue -= 1
            } else {
                t.invalidate()
                self.onTimeExpired()
            }
        }
    }

    @MainActor
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    @MainActor
    private func onTimeExpired() {
        answerResult = .wrong

        if let correct = currentQuestion?.correctIndex {
            for i in 0..<buttonStates.count {
                buttonStates[i] = (i == correct) ? .correct : .disabled
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.startNewGame()
        }
    }


        // MARK: - Answer selecting

        func selectAnswer(_ index: Int) {
            guard answerResult == .none else { return } // already answered
            guard buttonStates.indices.contains(index) else { return }

            stopTimer()
            // disable other buttons visually
            for i in 0..<buttonStates.count {
                if i != index { buttonStates[i] = .disabled }
            }

            // check correctness
            if index == currentQuestion?.correctIndex {
                // correct
                withAnimation(.easeIn(duration: 0.25)) {
                    buttonStates[index] = .correct
                }
                answerResult = .correct
                // short delay then go to next
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) { [weak self] in
                    self?.goToNextQuestion()
                }
            } else {
                // wrong
                withAnimation(.easeIn(duration: 0.25)) { [weak self] in
                    self?.buttonStates[index] = .wrong
                    if let correct = self?.currentQuestion?.correctIndex {
                        self?.buttonStates[correct] = .correct
                    }
                }
                answerResult = .wrong
                // after short delay restart game
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
                    self?.startNewGame()
                }
            }
        }

        // MARK: - Hints

        func use5050() {
            // disable two wrong answers
            guard let correct = currentQuestion?.correctIndex else { return }
            var wrongIndices = (0..<4).filter { $0 != correct }
            wrongIndices.shuffle()
            // disable first two wrongs
            for i in 0..<min(2, wrongIndices.count) {
                let idx = wrongIndices[i]
                disabledAnswers.insert(idx)
                if buttonStates.indices.contains(idx) {
                    buttonStates[idx] = .disabled
                }
            }
        }

        func useCallFriend() {
            // placeholder — you can implement logic to show hint UI
        }

        func useAudience() {
            // placeholder — implement audience poll simulation
        }

        // Helper to expose state for view
        func buttonState(for index: Int) -> AnswerButtonState {
            if disabledAnswers.contains(index) { return .disabled }
            guard buttonStates.indices.contains(index) else { return .normal }
            return buttonStates[index]
        }
    }
