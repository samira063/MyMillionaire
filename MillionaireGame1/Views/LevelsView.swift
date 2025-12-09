//import SwiftUI
//
//struct LevelsView: View {
//    let currentIndex: Int
//    let levels: [Int]
//
//    @Environment(\.dismiss) private var dismiss
//
//    var body: some View {
//        ZStack {
//            backgroundView
//            content
//        }
//    }
//
//    // MARK: - Background вынесено отдельно (исправляет ошибку компилятора)
//    private var backgroundView: some View {
//        LinearGradient(
//            colors: [
//                Color(hex: "001A45"),
//                Color(hex: "003A8D")
//            ],
//            startPoint: .top,
//            endPoint: .bottom
//        )
//        .ignoresSafeArea()
//    }
//
//    // MARK: - Основной контент
//    private var content: some View {
//        VStack {
//            header
//            title
//            levelsList
//            Spacer()
//        }
//    }
//
//    private var header: some View {
//        HStack {
//            Button { dismiss() } label: {
//                Image(systemName: "chevron.left")
//                    .font(.title2)
//                    .foregroundColor(.white)
//            }
//            Spacer()
//        }
//        .padding()
//    }
//
//    private var title: some View {
//        Text("LEVELS")
//            .font(.largeTitle.bold())
//            .foregroundColor(.yellow)
//            .padding(.bottom, 8)
//    }
//
//    private var levelsList: some View {
//        ScrollView {
//            VStack(spacing: 10) {
//                ForEach(levels.indices.reversed(), id: \.self) { idx in
//                    levelRow(idx: idx)
//                }
//            }
//            .padding(.vertical)
//        }
//    }
//
//    private func levelRow(idx: Int) -> some View {
//        let money = levels[idx]
//        let isCurrent = idx == currentIndex
//
//        return HStack {
//            Text("$\(money)")
//                .font(.headline)
//                .foregroundColor(isCurrent ? .black : .white)
//                .padding()
//                .frame(maxWidth: .infinity)
//                .background(backgroundForRow(isCurrent))
//                .overlay(
//                    RoundedRectangle(cornerRadius: 12)
//                        .stroke(Color.white.opacity(isCurrent ? 0.85 : 0.25), lineWidth: 1.5)
//                )
//        }
//        .padding(.horizontal)
//    }
//
//    private func backgroundForRow(_ isCurrent: Bool) -> some View {
//        Group {
//            if isCurrent {
//                LinearGradient(
//                    colors: [
//                        Color(hex: "FFE259"),
//                        Color(hex: "FFA751")
//                    ],
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing
//                )
//            } else {
//                Color.white.opacity(0.12)
//            }
//        }
//        .clipShape(RoundedRectangle(cornerRadius: 12))
//    }
//}
import SwiftUI

struct LevelsView: View {
    let currentLevel: Int
    
    private let prizeList = [
        1000000, 500000, 250000, 125000, 64000,
        32000, 16000, 8000, 4000, 2000,
        1000, 500
    ]

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(hex: "001A45"), Color(hex: "003A8D")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 14) {
                    ForEach(prizeList.indices, id: \.self) { i in
                        let prize = prizeList[i]
                        let number = prizeList.count - i

                        HStack {
                            Text("\(number)")
                                .foregroundColor(.white)
                                .font(.title3.bold())
                                .frame(width: 40, alignment: .leading)

                            Text("$\(prize)")
                                .foregroundColor(prizeIndex(prize) == currentLevel ? .yellow : .white)
                                .font(.title2.bold())

                            Spacer()
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(prizeIndex(prize) == currentLevel ?
                                      Color.yellow.opacity(0.25) :
                                      Color.white.opacity(0.10))
                        )
                    }
                }
                .padding()
            }
        }
    }

    private func prizeIndex(_ prize: Int) -> Int {
        return prizeList.reversed().firstIndex(of: prize) ?? 0
    }
}
