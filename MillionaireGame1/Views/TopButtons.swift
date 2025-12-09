import SwiftUI

struct TopButtons: View {
    var backAction: (() -> Void)?
    var menuAction: (() -> Void)?

    var body: some View {
        HStack {
            Button(action: { backAction?() }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
            }

            Spacer()

            Button(action: { menuAction?() }) {
                Image(systemName: "line.3.horizontal")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal)
    }
}
