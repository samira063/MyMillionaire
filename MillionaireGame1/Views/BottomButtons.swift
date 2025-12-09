import SwiftUI

struct BottomButtons: View {
    var use5050: () -> Void
    var useAudience: () -> Void
    var useCall: () -> Void

    var body: some View {
        HStack(spacing: 30) {
            smallIcon(name: "50.circle", action: use5050)
            smallIcon(name: "person.3.sequence.fill", action: useAudience)
            smallIcon(name: "phone.fill", action: useCall)
        }
    }

    private func smallIcon(name: String, action: @escaping ()->Void) -> some View {
        Button(action: action) {
            Circle()
                .fill(Color.white.opacity(0.12))
                .frame(width: 64, height: 64)
                .overlay(Image(systemName: name).foregroundColor(.white).font(.title2))
                .shadow(color: Color.black.opacity(0.25), radius: 6, x: 0, y: 4)
        }
    }
}
