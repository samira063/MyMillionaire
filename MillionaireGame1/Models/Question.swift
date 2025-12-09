import Foundation

struct Question: Identifiable, Codable {
    let id: Int
    let text: String
    let options: [String]
    let correctIndex: Int
    let price: Int?    // ← ОБЯЗАТЕЛЬНО делаем необязательным
}

// Безопасное обращение к массиву
extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
