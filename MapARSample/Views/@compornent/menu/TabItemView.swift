import SwiftUI

/// 各タブアイテムのView
struct TabItemView: View {
    @Binding var presentSideMenu: Bool
    let title: String

    var body: some View {
        VStack {
            HStack {
                Button {
                    presentSideMenu.toggle()
                } label: {
                    Image(systemName: "list.bullet")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.black)
                }
                Spacer()
            }
            Spacer()
            Text(title)
                .font(.system(size: 32, weight: .medium))
            Spacer()
        }
    }
}
