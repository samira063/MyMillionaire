//import SwiftUI
//
//struct TimerView: View {
//    var time: Int
//
//    var body: some View {
//        ZStack {
//            Capsule()
//                .fill(Color.white.opacity(0.10))
//                .frame(width: 86, height: 40)
//
//            HStack(spacing: 8) {
//                Image(systemName: "timer")
//                    .foregroundColor(.white)
//                Text(String(format: "%02d", time))
//                    .font(.system(size: 16, weight: .bold))
//                    .foregroundColor(Color.orange)
//            }
//        }
//    }
//}
import SwiftUI

struct TimerView: View {
    var time: Int

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white.opacity(0.12))
                .frame(width: 56, height: 56)

            Text("\(time)")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(Color.orange)
        }
    }
}
