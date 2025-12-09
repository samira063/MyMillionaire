import SwiftUI

struct GameTopBar: View {
    let timerValue: Int
    let use5050: () -> Void
    let useCallFriend: () -> Void

    var body: some View {
        HStack {
            Button(action: use5050) {
                Image(systemName: "circle.lefthalf.fill")
                    .font(.title2)
                    .foregroundColor(.white)
            }

            Spacer()

            Text("⏱️ \(timerValue)")
                .font(.title3.bold())
                .foregroundColor(.yellow)

            Spacer()

            Button(action: useCallFriend) {
                Image(systemName: "phone.fill")
                    .font(.title2)
                    .foregroundColor(.white)
            }
        }
    }
}
